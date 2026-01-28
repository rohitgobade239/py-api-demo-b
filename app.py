from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({"message": "Welcome to Py API Demo!"})

@app.route('/add', methods=['POST'])
def add_numbers():
    data = request.get_json()
    result = data.get('a', 0) + data.get('b', 0)
    return jsonify({"result": result})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
