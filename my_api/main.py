from datetime import datetime
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
import os

app = Flask(__name__)
basedir = os.path.abspath(os.path.dirname(__file__))

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(basedir, 'db.sqlite')

# suppress SQLALCHEMY_TRACK_MODIFICATIONS warning
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
ma = Marshmallow(app)


class EventItem(db.Model):
    name = db.Column(db.String(100), primary_key=True, nullable=False)
    location = db.Column(db.String(100), nullable=False)
    time = db.Column(db.DateTime, nullable=False)
    img_url = db.Column(db.String(500))
    favorite = db.Column(db.Boolean)
    tag1 = db.Column(db.String(50))
    tag2 = db.Column(db.String(50))
    tag3 = db.Column(db.String(50))

    def __init__(self,name,location,time,img_url,favorite,tag1,tag2,tag3):
        self.name = name
        self.location = location
        self.time = time
        self.img_url= img_url
        self.favorite= favorite
        self.tag1 = tag1
        self.tag2 = tag2
        self.tag3 = tag3

class EventSchema(ma.Schema):
    class Meta:
        fields = ('name', 'location', 'time', 'img_url', 'favorite', 'tag1', 'tag2', 'tag3')

event_schema = EventSchema()
events_schema = EventSchema(many=True)

@app.route('/event', methods=['POST'])
def add_event():
    name = request.json['name']
    location = request.json['location']
    time = datetime.strptime((request.json['time']), '%Y-%m-%dT%H:%M')
    img_url = request.json['img_url']
    favorite = request.json['favorite']
    tag1 = request.json['tag1']
    tag2 = request.json['tag2']
    tag3 = request.json['tag3']

    new_event_item = EventItem(name, location, time, img_url, favorite, tag1, tag2, tag3)
    db.session.add(new_event_item)
    db.session.commit()

    return event_schema.jsonify(new_event_item)

@app.route('/event', methods=['GET'])
def get_events():
    all_events = EventItem.query.all()
    result = events_schema.dump(all_events)

    return jsonify(result)

@app.route('/event/<name>', methods=['PUT', 'PATCH'])
def favorite_event(name):
    event_to_fav = EventItem.query.get(name)

    event_to_fav.favorite = not event_to_fav.favorite
    db.session.commit()

    return event_schema.jsonify(event_to_fav)

@app.route('/event/<name>', methods=['DELETE'])
def delete_event(name):
    event_to_delete = EventItem.query.get(name)
    db.session.delete(event_to_delete)
    db.session.commit()

    return event_schema.jsonify(event_to_delete)

with app.app_context():
    db.create_all()