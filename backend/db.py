import hashlib
import bcrypt
import os
import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


friendship = db.Table("friendship", db.Model.metadata,
                      db.Column("friendship_id", db.Integer,
                                primary_key=True, autoincrement=True),
                      db.Column("main_id", db.Integer,
                                db.ForeignKey("user.id")),
                      db.Column("friend_id", db.Integer, db.ForeignKey("user.id")))

target_assoc = db.Table("association_target", db.Model.metadata,
                        db.Column("user_id", db.Integer,
                                  db.ForeignKey("user.id")),
                        db.Column("card_id", db.Integer,
                                  db.ForeignKey("card.id"))
                        )

target_of_assoc = db.Table("association_target_of", db.Model.metadata,
                           db.Column("user_id", db.Integer,
                                     db.ForeignKey("user.id")),
                           db.Column("card_id", db.Integer,
                                     db.ForeignKey("card.id"))
                           )


class User(db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)

    # Profile information
    name = db.Column(db.String, nullable=False)
    university = db.Column(db.String, default="Cornell")
    grade = db.Column(db.Integer, default=0)

    # Social information
    comments = db.relationship("Comment", cascade="delete")
    posts = db.relationship("Post", cascade="delete")
    friends = db.relationship("User",
                              secondary=friendship,
                              primaryjoin=id == friendship.c.main_id,
                              secondaryjoin=id == friendship.c.friend_id,
                              back_populates="friends")

    # Game information
    game = db.Column(db.Integer, db.ForeignKey("game.id"))
    stats = db.Column(db.Integer, default=0)
    target_of_card = db.relationship(
        "Card", secondary=target_of_assoc, back_populates="belong")
    # The card that contains this user as the target
    target_card = db.relationship(
        "Card", secondary=target_assoc, back_populates="target")
    # The card that the user has to spot

    # authentication information
    email = db.Column(db.String, nullable=False, unique=True)
    password_digest = db.Column(db.String, nullable=False)

    # authentication session information
    session_token = db.Column(db.String, nullable=False, unique=True)
    session_expiration = db.Column(db.DateTime, nullable=False)
    update_token = db.Column(db.String, nullable=False, unique=True)

    def __init__(self, **kwargs):
        """
        Initializes a User object
        """
        # Default inputs for the user information
        self.name = "No input"
        self.university = "Cornell University"
        self.grade = 0
        self.comments = []
        self.posts = []
        self.friends = []
        self.game = 1
        self.stats = 0
        self.target_card = []
        self.target_of_card = []

        # store the inputted registration information
        self.email = kwargs.get("email")
        self.password_digest = bcrypt.hashpw(kwargs.get(
            "password").encode("utf8"), bcrypt.gensalt(rounds=13))
        self.renew_session()

    def serialize_profile(self):
        """
        Serializes the profile of the user. This includes id, name, university, grade
        """
        return {
            "id": self.id,
            "name": self.name,
            "university": self.university,
            "grade": self.grade
        }

    def serialize_friends(self):
        """Serializes the profiles of the user's friends"""
        return {
            "id": self.id,
            "friends": [f.serialize_profile() for f in self.friends]
        }

    def serialize_posts(self):
        """
        Serializes the posts of the user.
        """
        return {
            "id": self.id,
            "posts": [p.serialize() for p in self.posts]
        }

    def serialize_game(self):
        """
        Serializes game information of the user
        """
        return {
            "id": self.id,
            "target_of_card": [t.serialize() for t in self.target_of_card],
            "target_card": [t.serialize() for t in self.target_card],
            "game": Game.query.filter_by(id=self.game).first().serialize_info(),
            "stats": self.stats
        }

    # Authentication functions

    def _urlsafe_base_64(self):
        """
        Randomly generates hashed tokens (used for session/update tokens)
        """
        return hashlib.sha1(os.urandom(64)).hexdigest()

    def renew_session(self):
        """
        Renews the sessions, i.e.
        1. Creates a new session token
        2. Sets the expiration time of the session to be a day from now
        3. Creates a new update token
        """
        self.session_token = self._urlsafe_base_64()
        self.session_expiration = datetime.datetime.now() + datetime.timedelta(days=1)
        self.update_token = self._urlsafe_base_64()

    def verify_password(self, password):
        """
        Verifies the password of a user
        """
        return bcrypt.checkpw(password.encode("utf8"), self.password_digest)

    def verify_session_token(self, session_token):
        """
        Verifies the session token of a user
        """
        return session_token == self.session_token and datetime.datetime.now() < self.session_expiration

    def verify_update_token(self, update_token):
        """
        Verifies the update token of a user
        """
        return update_token == self.update_token


class Game(db.Model):
    __tablename__ = "game"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, default="none", nullable=False)
    users = db.relationship("User", cascade="delete")
    is_private = db.Column(db.Boolean, nullable=False)
    cards = db.relationship("Card", cascade="delete")

    # Leaderboard information, should be updated
    # first = db.Column(db.Integer, db.ForeignKey("user.id"))
    # second = db.Column(db.Integer, db.ForeignKey("user.id"))
    # third = db.Column(db.Integer, db.ForeignKey("user.id"))

    def serialize_info(self):
        """
        Serializes basic information of the card (id, name, privacy)
        """
        return {
            "id": self.id,
            "name": self.name,
            "is_private": self.is_private
        }

    # def serialize_leaderboard(self):
    #     """
    #     Serializes the profiles of the users on the leaderboard
    #     """
    #     return {
    #         "first": User.query.filter_by(id=self.first).first().serialize_profile(),
    #         "second": User.query.filter_by(id=self.second).first().serialize_profile(),
    #         "third": User.query.filter_by(id=self.third).first().serialize_profile()
    #     }

    def init_public_game():
        """Initializes a public game that will have id=0"""
        new_game = Game(
            name="public default",
            users=[],
            is_private=False,
            cards=[]
            # add leaderboard
        )
        db.session.add(new_game)
        db.session.flush()
        db.session.commit()


class Card(db.Model):
    __tablename__ = "card"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    target = db.relationship(
        "User", secondary=target_assoc, back_populates="target_card")
    belong = db.relationship(
        "User", secondary=target_of_assoc, back_populates="target_of_card")
    game = db.Column(db.Integer, db.ForeignKey("game.id"), nullable=False)

    def serialize(self):
        """
        Serializes the contents of the card
        """
        return {
            "id": self.id,
            "target": User.query.filter_by(id=self.target).first().serialize_profile(),
            "belong": [u.serialize_profile() for u in self.belong],
            "game": Game.query.filter_by(id=self.game).first().serialize_info()
        }


class Post (db.Model):
    __tablename__ = "post"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    time = db.Column(
        db.String, default="")
    comments = db.relationship("Comment", cascade="delete")
    title = db.Column(db.String, default="no title")
    contents = db.Column(db.String, default="no content")

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
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    time = db.Column(
        db.String, default="")
    post = db.Column(db.Integer, db.ForeignKey("post.id"), nullable=False)
    contents = db.Column(db.String)

    def serialize(self):
        """
        Serializes the contents of the comment
        """
        return {
            "id": self.id,
            "user": User.query.filter_by(id=self.user).first().serialize_profile(),
            "time": self.time,
            "contents": self.contents
        }
