from flask import Flask, render_template, request
import database_manager as dbHandler

app = Flask(__name__)

# Route for the homepage
@app.route('/')
def index():
    return render_template('index.html')

# Route for the About page
@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/search')
def search_sightings():
    return render_template('search_sightings.html')

@app.route('/donate')
def donate():
    return render_template('donate.html')

if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0', port=5000)