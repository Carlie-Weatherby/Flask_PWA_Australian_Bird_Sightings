from flask import Flask, render_template, request
import database_manager as dbHandler

app = Flask(__name__)

# Route for the homepage
@app.route('/')
def index():
    species_data = dbHandler.listSpecies()
    # return render_template('index.html')
    return render_template('index.html', content=species_data)

# Route for the About page
@app.route('/about')
def about():
    return render_template('about.html')

# Route for the Search Sightings page
@app.route('/search', methods=['GET'])
def search_sightings():
    search_type = request.args.get('search_type') # Get the selected search type
    if search_type == 'all':
        species_data = dbHandler.listSpecies()
    else:
        species_data = [] # Clear data if "None" is selected or no valid option is chosen
    return render_template('search_sightings.html', content=species_data)

# Route for the Donate page
@app.route('/donate')
def donate():
    return render_template('donate.html')



if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0', port=5000)