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
    tag1 = db.Column(db.String(50))
    tag2 = db.Column(db.String(50))
    tag3 = db.Column(db.String(50))

    def __init__(self,name,location,time,tag1,tag2,tag3):
        self.name = name
        self.location = location
        self.time = time
        self.tag1 = tag1
        self.tag2 = tag2
        self.tag3 = tag3

class EventSchema(ma.Schema):
    class Meta:
        fields = ('name', 'location', 'time', 'tag1', 'tag2', 'tag3')

event_schema = EventSchema()
events_schema = EventSchema(many=True)

@app.route('/event', methods=['POST'])
def add_event():
    name = request.json['name']
    location = request.json['location']
    time = request.json['time']
    tag1 = request.json['tag1']
    tag2 = request.json['tag2']
    tag3 = request.json['tag3']

    new_event_item = EventItem(name, location, time, tag1, tag2, tag3)
    db.session.add(new_event_item)
    db.session.commit()

    return event_schema.jsonify(new_event_item)

@app.route('/event', methods=['GET'])
def get_events():
    all_events = EventItem.query.all()
    result = events_schema.dump(all_events)

    return jsonify(result)

with app.app_context():
    db.create_all()