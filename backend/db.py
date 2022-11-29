from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Leaderboard
# First
# Second
# Third

# your classes here

# User
# Rankings
# Login
# Profile Picture

friendship = db.Table("friendship", db.Model.metadata, 
db.Column("friendship_id", db.Integer, primary_key = True, autoincrement=True),
db.Column("main_id", db.Integer, db.ForeignKey("user.id")), 
db.Column("friend_id", db.Integer, db.ForeignKey("user.id")))

class User(db.Model): 
  __tablename__ = "user"
  id = db.Column (db.Integer, primary_key = True, autoincrement=True)
  name = db.Column(db.String, nullable=False)
  university = db.Column (db.String)
  grade = db.Column (db.Integer)
  spotted = db.Column(db.Integer, nullable= False)
  card = db.Column(db.Integer, db.ForeignKey("card.id"))
  comments = db.relationship("Comment", cascade = "delete")
  posts = db.relationship("Post", cascade= "delete")
  game = db.Column (db.Integer, db.ForeignKey("game.id"))
  stats = db.Column (db.Integer, db.ForeignKey("stats.id"))
  friends = db.relationship("User", 
  secondary = friendship, 
  primaryjoin= id == friendship.c.main_id, 
  secondaryjoin = id == friendship.c.friend_id, 
  back_populates="main")
  
  def serialize_profile(self): 
    """
    Serializes the profile of the user. This includes id, name, university, grade
    """
    return{
      "id": self.id, 
      "name": self.name, 
      "university": self.university, 
      "grade": self.grade
    }
  
  def serialize_posts(self): 
    """
    Serializes the posts of the user. 
    """
    return{
      "id": self.id, 
      "posts": [p.serialize() for p in self.posts]
    }
   
class Card(db.Model): 
  __tablename__ = "card"
  id = db.Column (db.Integer, primary_key = True, autoincrement=True)
  game = db.Column (db.Integer, db.ForeignKey("game.id"), nullable=False)
  target = db.Column(db.Integer, db.ForeignKey("user.id"), nullable= False)
  belong = db.relationship("User", cascade = "delete")

class Game(db.Model): 
  __tablename__ = "game"
  id = db.Column (db.Integer, primary_key = True, autoincrement=True)
  users = db.relationship("User", cascade="delete")
  cards = db.relationship("Card", cascade = "delete")
  is_private = db.Column (db.Boolean, nullable=False)


class Post (db.Model): 
  __tablename__ = "post"
  id = db.Column (db.Integer, primary_key = True, autoincrement=True)
  user = db.Column (db.Integer, db.ForeignKey("user.id"), nullable=False)
  time = db.Column (db.String, nullable= False)
  comments = db.relationship("Comment", cascade="delete")
  title = db.Column (db.String)
  contents = db.Column (db.String)

  def serialize(self):
    """
    Serializes the contents of the post
    """
    return {
      "id": self.id, 
      "user": User.query.filter_by(id=self.user).first().serialize_profile(),
      "time": self.time, 
      "comments": [c.serialize() for c in self.comments], 
      "title": self.title, 
      "contents": self.contents
    }



class Comment (db.Model): 
  __tablename__ = "comment"
  id = db.Column (db.Integer, primary_key = True, autoincrement=True)
  user = db.Column (db.Integer, db.ForeignKey("user.id"), nullable=False)
  time = db.Column (db.String, nullable= False)
  post = db.Column (db.Integer, db.ForeignKey("post.id"), nullable = False)
  contents = db.Column (db.String)

  def serialize(self): 
    """
    Serializes the contents of the comment
    """
    return{
      "id": self.id, 
      "user": User.query.filter_by(id=self.user).first().serialize_profile(),
      "time": self.time,
      "contents": self.contents
    }


class Stats (db.Model): 
  __tablename__ = "stats"
  id = db.Column (db.Integer, primary_key = True, autoincrement=True)
  total = db.Column (db.Integer)

  def serialize(self):
    """
    Serializes the stats of the user
    """
    return{
      "id": self.id, 
      "total": self.total
    }

