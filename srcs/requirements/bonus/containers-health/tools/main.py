from flask import Flask, jsonify, request, render_template
from flask_cors import CORS
import requests

CONTAINER = ['nginx:443', 'adminer:8080', 'website:8000']
STATUS = {
	'nginx': 'down',
	'adminer': 'down',
	'website': 'down'
}
app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
	global STATUS
	for container in CONTAINER:
		try:
			requests.get(f"http://{container}")
			STATUS[container.split(':')[0]] = 'Running'
		except:
			STATUS[container.split(':')[0]] = 'Down'
   	
	return render_template('index.html', content=STATUS)



if __name__ == '__main__':
	app.run(host ='0.0.0.0', port = 5050, debug = True)