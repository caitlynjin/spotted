from db import db
from db import User
from db import Comment
from db import Post
from flask import Flask
from flask import request 
import json
import os

app = Flask(__name__)
db_filename = "spotted.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

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
  return "Welcome to the TITLE. This game is created by... "

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

@app.route("/api/user/<int:user_id>/")
def get_user(user_id): 
  """Endpoint to get a specific user by id"""

@app.route("/api/user/<int:user_id>", methods=['POST'])
def get_update_user(user_id): 
  """Endpoint to update about a user"""

@app.route("/api/post/<int:user_id>", methods=['POST'])
def create_post(): 
  """Endpoint to create a post for a user"""

@app.route("/api/post/<int:user_id>")
def get_posts(): 
  """Endpoint to get all posts of a user"""

@app.route("/api/post/<int:post_id>/", methods=['DELETE'])
def delete_post(post_id): 
  """Endpoint to delete a post by id"""

@app.route("/api/comment/<int:user_id>/<int:post_id>/", methods=['POST'])
def create_comment(user_id, post_id): 
  """Endpoint to create a comment for a user"""

@app.route("/api/comment/<int:post_id>/")
def get_comment(post_id): 
  """Endpoint to get all comments of a post"""

@app.route("/api/comment/<int:comment_id>/", methods=['DELETE'])
def delete_comment(comment_id): 
  """Endpoint to delete a comment by id"""


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
