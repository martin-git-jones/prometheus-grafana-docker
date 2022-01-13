# A simple Python Flask app that responds to /ping
# with a json response {"message": "pong"}

# Martin Jones, martin@mailpony.uk 
# 12 January, 2022

from flask import Flask, jsonify
from prometheus_client import Counter, generate_latest

PORT = 5000 
app = Flask(__name__)
app.config['ENV'] = 'development'

# creating route
@app.route("/ping")
def pong():
    ping_metric.inc()
    pong = {"message": "pong"}
    return jsonify(pong) 

# creating metrics
@app.route("/metrics")
def http_requests():
    return generate_latest() 

if __name__ == "__main__":
    ping_metric = Counter('http_requests_total', 'Ping')
    app.run(debug=True,host='0.0.0.0',port=PORT)
