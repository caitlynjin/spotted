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
    name = db.Column(db.String, nullable=False)
    university = db.Column(db.String, default="")
    grade = db.Column(db.Integer, default=0)
    comments = db.relationship("Comment", cascade="delete")
    posts = db.relationship("Post", cascade="delete")
    game = db.Column(db.Integer, db.ForeignKey("game.id"))
    stats = db.Column(db.Integer, db.ForeignKey("stats.id"))
    friends = db.relationship("User",
                              secondary=friendship,
                              primaryjoin=id == friendship.c.main_id,
                              secondaryjoin=id == friendship.c.friend_id,
                              back_populates="friends")
    target_of_card = db.relationship(
        "Card", secondary=target_of_assoc, back_populates="belong")
    target_card = db.relationship(
        "Card", secondary=target_assoc, back_populates="target")

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
            "stats": Stats.query.filter_by(id=self.stats).first().serialize()
        }

    # def init_stats(self):
    #     """Initializes the stats id to match user id"""
    #     self.stats = self.id


class Game(db.Model):
    __tablename__ = "game"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    # Include a leaderboard
    name = db.Column(db.String, default="none", nullable=False)
    users = db.relationship("User", cascade="delete")
    is_private = db.Column(db.Boolean, nullable=False)
    cards = db.relationship("Card", cascade="delete")

    def serialize_info(self):
        """
        Serializes basic information of the card (id, name, privacy)
        """
        return {
            "id": self.id,
            "name": self.name,
            "is_private": self.is_private
        }

    def init_public_game():
        """Initializes a public game that will have id=0"""
        new_game = Game(
            name="public default",
            users=[],
            is_private=False,
            cards=[]
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


class Stats (db.Model):
    __tablename__ = "stats"
    id = db.Column(db.Integer, primary_key=True)
    total = db.Column(db.Integer, default=0)

    def serialize(self):
        """
        Serializes the stats of the user
        """
        return {
            "id": self.id,
            "total": self.total
        }

    def init_stats():
        """Initializes the stats for a first time user"""
        new_stats = Stats(
            total=0
        )
        db.session.add(new_stats)
        db.session.flush()
        db.session.commit()
        return new_stats.id
