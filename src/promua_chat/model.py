import calendar
import os
from base64 import b64decode, b64encode
from datetime import datetime, timedelta
from hashlib import sha256

from sqlalchemy import Column, Integer, UnicodeText, Date, DateTime, String, \
    BigInteger, Enum, SmallInteger, func, text, \
    ForeignKey, Table
from sqlalchemy.orm import deferred, relationship, backref
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.hybrid import hybrid_property

from sqlalchemy.schema import UniqueConstraint

Base = declarative_base()
metadata = Base.metadata

from sqlalchemy.types import TypeDecorator, VARCHAR
import json

class JSONEncodedDict(TypeDecorator):
    """Represents an immutable structure as a json-encoded string.

    Usage::

        JSONEncodedDict(255)

    """

    impl = VARCHAR

    def process_bind_param(self, value, dialect):
        if value is not None:
            value = json.dumps(value)

        return value

    def process_result_value(self, value, dialect):
        return json.loads(value) if value is not None else []


room_membership_association = Table('room_membership', Base.metadata,
    Column('user_id', Integer, ForeignKey('users.id')),
    Column('room_id', Integer, ForeignKey('chat_rooms.id'))
)


__all__ = ["User","Room","Message"]


class User(Base):
    """
    Typical User description
    """

    __tablename__ = "users"


    def __init__(self, **kwargs):
        super(User, self).__init__(**kwargs)

    id = Column(Integer, autoincrement=True, primary_key=True)
    username = Column(String(20), unique=True, index=True)
    displayname = Column(String(35), nullable=False)

    _salt = Column("salt", String(12))

    @hybrid_property
    def salt(self):
        """Generates a cryptographically random salt and sets its Base64 encoded
        version to the salt column, and returns the encoded salt.
        """
        if not self.id and not self._salt:
            self._salt = b64encode(os.urandom(8))

        return self._salt

    # 64 is the length of the SHA-256 encoded string length
    _password = Column("password", String(64))

    def __encrypt_password(self, password, salt):
        """
        Encrypts the password with the given salt using SHA-256. The salt must
        be cryptographically random bytes.

        :param password: the password that was provided by the user to try and
                         authenticate. This is the clear text version that we
                         will need to match against the encrypted one in the
                         database.
        :type password: basestring

        :param salt: the salt is used to strengthen the supplied password
                     against dictionary attacks.
        :type salt: an 8-byte long cryptographically random byte string
        """

        if isinstance(password, unicode):
            password_bytes = password.encode("UTF-8")
        else:
            password_bytes = password

        hashed_password = sha256()
        hashed_password.update(password_bytes)
        hashed_password.update(salt)
        hashed_password = hashed_password.hexdigest()

        if not isinstance(hashed_password, unicode):
            hashed_password = hashed_password.decode("UTF-8")

        return hashed_password

    @hybrid_property
    def password(self):
        return self._password

    @password.setter
    def password(self, password):
        self._password = self.__encrypt_password(password,
                                                 b64decode(str(self.salt)))

    def validate_password(self, password):
        """Check the password against existing credentials.

        :type password: unicode
        :param password: clear text password
        :rtype: bool
        """
        return self.password == self.__encrypt_password(password,
                                                        b64decode(str(self.salt)))

    created = Column(DateTime, default=datetime.utcnow, server_default=text("now()"), nullable=False)

class Message(Base):
    """
    Message in Room
    """

    __tablename__ = "messages"


    def __init__(self, **kwargs):
        super(Message, self).__init__(**kwargs)

    id = Column(Integer, autoincrement=True, primary_key=True)
    room_id = Column(Integer, ForeignKey('chat_rooms.id'))
    user_id = Column(Integer, ForeignKey('users.id'))
    text = Column(UnicodeText)
    meta = Column(JSONEncodedDict)
    date_time = Column(DateTime, default=datetime.utcnow, nullable=False)

    author = relationship("User",
                        backref="messages")

    room = relationship("Room",
                        backref="messages")


class Room(Base):
    """
    Room for hanging out
    """

    __tablename__ = "chat_rooms"


    def __init__(self, **kwargs):
        super(Room, self).__init__(**kwargs)

    id = Column(Integer, autoincrement=True, primary_key=True)
    name = Column(String(20), nullable=False, unique=True, index=True)
    creator_id = Column(Integer, ForeignKey('users.id'))
    
    members = relationship("User",
                        secondary=room_membership_association,
                        backref="rooms")
    # for creator
    creator = relationship("User",
                        backref="own_rooms")
