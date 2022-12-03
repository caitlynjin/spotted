from db import db
from db import *
from flask import Flask
from flask import request
import json
import os
import datetime
import users_dao

app = Flask(__name__)
db_filename = "spotted.db"
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()
    Game.init_public_game()


################ Helper functions ################

def success_response(data, code=200):
    """
    Generalize the success response formats
    """
    return json.dumps(data), code


def failure_response(message, code=404):
    """
    Generalize the failure response formats
    """
    return json.dumps({"error": message}), code


def extract_token(request):
    """
    Helper function to extract token from header of request
    """
    auth_header = request.headers.get("Authorization")
    if auth_header is None:
        return False, failure_response("Missing authorization header.", 400)

    # Header looks like "Authorization: Bearer <Token>"
    bearer_token = auth_header.replace("Bearer ", "").strip()
    if bearer_token is None or not bearer_token:
        return False, (failure_response("Invalid authorization header", 400))

    return True, bearer_token


################ Greeting routes ################
@app.route("/")
def greeting():
    """Endpoint for greeting user by reading from .env file"""
    return "Welcome to " + os.environ["NAME"] + "! /nThis game is created by "\
        + os.environ["DESIGN"] + ", " + \
        os.environ["FRONTEND"] + ", " + os.environ["BACKEND"]


################ Authentication routes ################

@app.route("/register/", methods=["POST"])
def register_account():
    """
    Endpoint for registering a new session
    """
    body = json.loads(request.data)
    email = body.get("email")
    password = body.get("password")

    if email is None or password is None:
        return failure_response("Missing email or password", 400)

    success, user = users_dao.create_user(email, password)

    if not success:
        return failure_response("User already exists", 400)

    return success_response({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    }
    )


@app.route("/login/", methods=["POST"])
def login():
    """
    Endpoint for logging in
    """
    body = json.loads(request.data)
    email = body.get("email")
    password = body.get("password")

    if email is None or password is None:
        return failure_response("Missing email or password", 400)

    success, user = users_dao.verify_credentials(email, password)

    if not success:
        return failure_response("Incorrect email or password", 401)

    return success_response({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    })


@app.route("/session/", methods=["POST"])
def update_session():
    """
    Endpoint for updating a user's session
    """
    success, update_token = extract_token(request)

    if not success:
        return update_token

    success_session, user = users_dao.renew_session(update_token)

    if not success_session:
        return failure_response("Invalid update token", 400)

    return success_response({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    })


@app.route("/logout/", methods=["POST"])
def logout():
    """
    Endpoint for logging out
    """
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    user.session_token = ""
    user.session_expiration = datetime.datetime.now()
    user.update_token = ""

    db.session.commit()
    return success_response({"message": "You have successfully logged out."})


################ User routes ################

@app.route("/api/user/")
def get_all_users():
    """Endpoint to get all users' profiles"""
    users = []
    for u in User.query.all():
        users.append(u.serialize_profile())
    return success_response({"users": users})


@app.route("/api/user/", methods=['POST'])
def create_user():
    """Endpoint to create an user with verified credentials"""
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    body = json.loads(request.data)
    name = body.get('name')
    if name is None:
        return failure_response("Name field cannot be empty", 400)

    user.name = name
    user.university = body.get('university', user.university)
    user.grade = body.get('grade', user.grade)

    db.session.commit()
    return success_response(user.serialize_profile(), 201)


@app.route("/api/user/<int:user_id>/", methods=['DELETE'])
def delete_user(user_id):
    """Endpoint to delete a user by id with verified credentials"""
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize_profile())


@app.route("/api/user/<int:user_id>/profile/")
def get_user_profile(user_id):
    """Endpoint to get a specific user's profile by id"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    return success_response(user.serialize_profile())


@app.route("/api/user/<int:user_id>/game/")
def get_user_game(user_id):
    """Endpoint to get a specific user's game information by id"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    return success_response(user.serialize_game())


@app.route("/api/user/<int:user_id>/profile", methods=['POST'])
def update_user_profile(user_id):
    """Endpoint to update user profile after verifying credentials"""
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    body = json.loads(request.data)
    user.name = body.get('name', user.name)
    user.university = body.get('university', user.university)
    user.grade = body.get('grade', user.grade)
    db.session.commit()
    return success_response(user.serialize_profile())


@app.route("/api/user/<int:user_id>/friend/", methods=['POST'])
def update_user_friend(user_id):
    """Endpoint to add friend to an user after verifying credentials"""
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    body = json.loads(request.data)
    friend_id = body.get('friend_id')

    friend = User.query.filter_by(id=friend_id).first()
    if friend is None:
        return failure_response("Friend not found! ")

    user.friends.append(friend)
    db.session.commit()
    return success_response(user.serialize_friends())


@app.route("/api/user/<int:user_id>/game/", methods=['POST'])
def update_user_game(user_id):
    """Endpoint to change game for an user after verifying credentials"""

    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    body = json.loads(request.data)
    game_id = body.get('game_id')

    game = User.query.filter_by(id=game_id).first()
    if game is None:
        return failure_response("Game not found! ")
    user.game = game_id
    user.target_card = []
    user.target_of_card = []
    db.session.commit()
    return success_response(user.serialize_game())


################ Post routes ################

@app.route("/api/post/<int:user_id>/", methods=['POST'])
def create_post(user_id):
    """Endpoint to create a post for a user after verifying credentials"""
    # user = User.query.filter_by(id=user_id).first()
    # if user is None:
    #     return failure_response("User not found!")

    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    body = json.loads(request.data)
    title = body.get('title')
    if title is None:
        return failure_response("Title not inputted", 400)

    contents = body.get('contents')
    if contents is None:
        return failure_response("Contents not inputted", 400)

    new_post = Post(
        user=user_id,
        title=title,
        contents=contents,
        comments=[],
        time=str(datetime.datetime.now())
    )

    db.session.add(new_post)
    db.session.commit()
    return success_response(new_post.serialize())

@app.route("/api/post/")
def get_all_posts():
    """Endpoint to get all posts of all users"""
    posts = []
    for p in Post.query.all():
        posts.append(p.serialize())
    return success_response({"posts": posts})

@app.route("/api/post/<int:user_id>/")
def get_posts(user_id):
    """Endpoint to get all posts of a user"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")

    the_posts = []
    for p in Post.query.filter_by(user=user_id):
        the_posts.append(p.serialize())
    return success_response({"posts": the_posts})


@app.route("/api/post/<int:post_id>/", methods=['DELETE'])
def delete_post(post_id):
    """Endpoint to delete a post by id after verifying credentials"""
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found!")
    db.session.delete(post)
    db.session.commit()
    return success_response(post.serialize())

################ Comment routes ################


@app.route("/api/comment/<int:user_id>/<int:post_id>/", methods=['POST'])
def create_comment(user_id, post_id):
    """Endpoint to create a comment for a user after verifying credentials"""

    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found!")

    body = json.loads(request.data)
    contents = body.get('contents')
    if contents is None:
        return failure_response("Contents not inputted", 400)

    new_comment = Comment(
        user=user_id,
        contents=contents,
        post=post_id,
        time=str(datetime.datetime.now())
    )

    db.session.add(new_comment)
    db.session.commit()
    return success_response(new_comment.serialize())


@app.route("/api/comment/<int:post_id>/")
def get_comment(post_id):
    """Endpoint to get all comments of a post"""
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found!")

    the_comments = []
    for c in Comment.query.filter_by(post=post_id):
        the_comments.append(c.serialize())
    return success_response({"comments": the_comments})


@app.route("/api/comment/<int:comment_id>/", methods=['DELETE'])
def delete_comment(comment_id):
    """Endpoint to delete a comment by id after verifying credentials"""

    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    comment = Comment.query.filter_by(id=comment_id).first()
    if comment is None:
        return failure_response("Comment not found!")
    db.session.delete(comment)
    db.session.commit()
    return success_response(comment.serialize())


################ Game routes ################

@app.route("/api/game/", methods=['POST'])
def create_game():
    """Endpoint to create a game with a verified user"""
    success, session_token = extract_token(request)

    if not success:
        return failure_response("Could not extract session token", 400)

    user = users_dao.get_user_by_session_token(session_token)
    if user is None or not user.verify_session_token(session_token):
        return failure_response("Invalid session token", 400)

    body = json.loads(request.data)
    name = body.get('name', "")
    is_private = body.get('is_private', True)  # Default private game

    new_game = Game(
        name=name,
        is_private=is_private,
        users=[user],
        cards=[]
    )

    db.session.add(new_game)
    db.session.commit()
    user.game = new_game.id
    db.session.commit()
    return success_response(new_game.serialize_info())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
