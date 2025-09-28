from flask import Flask
import os

app = Flask(__name__)

# for the find out the colour
env_color = os.environ.get('ENV_COLOR', 'Blue')

@app.route('/')
def hello():
 # show in the web this message
    return f"<h1>Hello! Main {env_color} environment se live hoon.</h1>"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
