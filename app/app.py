from flask import Flask
import os

app = Flask(__name__)

# हम ENV_COLOR वेरिएबल से पता लगाएंगे कि यह Blue है या Green
env_color = os.environ.get('ENV_COLOR', 'Blue')

@app.route('/')
def hello():
    # यह मैसेज वेबसाइट पर दिखेगा
    return f"<h1>Hello! Main {env_color} environment se live hoon.</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)