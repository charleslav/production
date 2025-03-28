import os
from flask import Flask, request

app = Flask(__name__)
basic_url = "/webhook"

@app.route(basic_url + "/update", methods=['POST'])
def webhook():
    os.system("bash start_docker.sh")
    return "Webhook received!"

app.run(host='0.0.0.0', port=8000)

