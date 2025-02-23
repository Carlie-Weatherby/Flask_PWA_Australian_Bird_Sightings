from flask import Flask, render_template, request
import database_manager as dbHandler

app = Flask(__name__)

# ---------------------- ROUTES ----------------------

# Route for the homepage
@app.route('/')
def index():
    species_data = dbHandler.listSpecies()
    # return render_template('index.html')
    return render_template('index.html', bird_sightings=species_data) # Pass to template

# Route for the About page
@app.route('/about')
def about():
    return render_template('about.html')

# Route for the Search Sightings page
@app.route('/search', methods=['GET'])
def search_sightings():
    search_type = request.args.get('search_type') # GET the selected search type (so is a POST method)
    common_name = request.args.get('common_name') # GET the selected search type (so is a POST method)
    scientific_name = request.args.get('scientific_name') # GET the selected search type (so is a POST method)
    # Note: If using POST (not GET), then use requests.form
    
    if search_type == 'all':
        species_data = dbHandler.listSpecies()
    elif search_type =='common-name' and common_name:
        species_data = dbHandler.searchByCommonName(common_name)
    elif search_type =='scientific-name' and scientific_name:
        species_data = dbHandler.searchByScientificName(scientific_name) # Pass to template
    else:
        species_data = [] # Clear data if "None" is selected or no valid option is chosen
    return render_template('search_sightings.html', content=species_data) # Pass to template

# Route for the Donate page
@app.route('/donate')
def donate():
    return render_template('donate.html')

# ---------------------- APP ENTRY POINT ----------------------

if __name__ == '__main__':
    app.run(debug=True, host = '0.0.0.0', port=5000)