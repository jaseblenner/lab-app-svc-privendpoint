import platform

from flask import Flask
import psutil
import time
import os
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World, This is a Python Flask example app deployed via Terraform on {}!'.format(platform.uname()[1])


@app.route('/health')
def healthcheck():
    return 'OK'


@app.route('/uptime')
def container_uptime():
    return "{}".format(time.time() - psutil.Process(os.getpid()).create_time())
