from flask import Flask, render_template
import models

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("home.html")


@app.route("/dogs")
def dogs():
    return render_template("dogs.html", dogs=models.get_dogs())


@app.route("/cats")
def cats():
    return render_template("cats.html", cats=models.get_cats())
