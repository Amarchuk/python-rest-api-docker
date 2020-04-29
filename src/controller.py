from flask import Flask,request,jsonify
import logging
app = Flask(__name__)
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

@app.route('/v1/api', methods=['POST'])
def postSomeThing():
    content = request.json
    name = content['name']
    logger.info('name: %s',name)
    return "Hello %s" %name

@app.route('/predict', methods=['POST'])
def predict_pf():
    content = request.json
    model = content['model']
    logger.info('model: %s',model)
    
    prices = content['prices']
    logger.info('prices: %s',prices)

    prev_pf = content['prev_pf']
    logger.info('prev_pf: %s',prev_pf)

    return "[0.1, 0, 0, 0.3, 0.6]"

@app.route("/")
def hello():
    return "Hello World!"
