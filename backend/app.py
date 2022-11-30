from db import db
from db import *
from flask import Flask
from flask import request
import json
import os
import datetime

app = Flask(__name__)
db_filename = "spotted.db"
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()
    Game.init_public_game()


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


@app.route("/")
def greeting():
    """Endpoint for greeting user by reading from .env file"""
    return "Welcome to" + os.environ["NAME"] + "! This game is created by "\
        + os.environ["DESIGN"] + ", " + \
        os.environ["FRONTEND"] + ", " + os.environ["BACKEND"]


@app.route("/api/user/")
def get_all_users():
    """Endpoint to get all users' profiles"""
    users = []
    for u in User.query.all():
        users.append(u.serialize_profile())
    return success_response({"users": users})


@app.route("/api/user/", methods=['POST'])
def create_user():
    """Endpoint to create an user"""
    body = json.loads(request.data)
    name = body.get('name')
    stats_id = Stats.init_stats()
    # stats = Stats.query.filter_by(id=stats_id).first()
    # game = Game.query.filter_by(id=1).first()
    if name is None:
        return failure_response("Name field cannot be empty", 400)
    new_user = User(
        name=name,
        university=body.get('university'),
        grade=body.get('grade'),
        posts=[],
        comments=[],
        friends=[],
        game=1,
        stats=stats_id,
        target_of_card=[],
        target_card=[]
    )
    db.session.add(new_user)
    db.session.commit()
    return success_response(new_user.serialize_profile(), 201)


@app.route("/api/user/<int:user_id>/", methods=['DELETE'])
def delete_user(user_id):
    """Endpoint to delete a post by id"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize_profile())


@app.route("/api/user/<int:user_id>/profile")
def get_user_profile(user_id):
    """Endpoint to get a specific user's profile by id"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    return success_response(user.serialize_profile())


@app.route("/api/user/<int:user_id>/game")
def get_user_game(user_id):
    """Endpoint to get a specific user's game information by id"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")
    return success_response(user.serialize_game())


@app.route("/api/user/<int:user_id>/profile", methods=['POST'])
def get_update_user_profile(user_id):
    """Endpoint to update user profile"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")

    body = json.loads(request.data)
    user.name = body.get('name', user.name)
    user.university = body.get('university', user.university)
    user.grade = body.get('grade', user.grade)
    db.session.commit()
    return success_response(user.serialize_profile())


@app.route("/api/user/<int:user_id>/friend/", methods=['POST'])
def get_update_user_friend(user_id):
    """Endpoint to add friend to an user"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")

    body = json.loads(request.data)
    friend_id = body.get('friend_id')

    friend = User.query.filter_by(id=friend_id).first()
    if friend is None:
        return failure_response("Friend not found! ")

    user.friends.append(friend)
    db.session.commit()
    return success_response(user.serialize_friends())


@app.route("/api/user/<int:user_id>/game/", methods=['POST'])
def get_update_user_game(user_id):
    """Endpoint to change game for an user"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")

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


@app.route("/api/post/<int:user_id>/", methods=['POST'])
def create_post(user_id):
    """Endpoint to create a post for a user"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")

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
    """Endpoint to delete a post by id"""
    post = Post.query.filter_by(id=post_id).first()
    if post is None:
        return failure_response("Post not found!")
    db.session.delete(post)
    db.session.commit()
    return success_response(post.serialize())


@app.route("/api/comment/<int:user_id>/<int:post_id>/", methods=['POST'])
def create_comment(user_id, post_id):
    """Endpoint to create a comment for a user"""
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response("User not found!")

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
    """Endpoint to delete a comment by id"""
    comment = Comment.query.filter_by(id=comment_id).first()
    if comment is None:
        return failure_response("Comment not found!")
    db.session.delete(comment)
    db.session.commit()
    return success_response(comment.serialize())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
