from flask import Flask, render_template, request
import database_manager as dbHandler

app = Flask(__name__)

# Route for the homepage
@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0', port=5000)
