// File: search.js
// Description: Handles dropdown interactivity on the search page for displaying and saving the chosen search type.
// Author: Carlie Weatherby
// Date: January 2025

// Wrap code in an  Immediately Invoked Function Expression (IIFE) to prevent polluting the global namespace
(function () {
    "use strict"; // Enforce stricter parsing and error handling

    // 1. Variable Declarations
    const searchTypeDropdown = document.getElementById("search-type"); // Dropdown element
    const searchResult = document.getElementById("search-result"); // Output element
    const commonNameContainer = document.getElementById("common-name-container"); // Container for the text input
    const commonNameInput = document.getElementById("common-name-input"); // Text input for common name
    const scientificNameContainer = document.getElementById("scientific-name-container"); // Container for the text input
    const scientificNameInput = document.getElementById("scientific-name-input"); // Text input for scientific name       
    const STORAGE_KEY = "chosenSearchType"; // Key for storing the selection in localStorage

    // 2. Utility Functions

    /**
     * Updates the chosen search type displayed below the dropdown.
     * @param {string} selectedText - The text of the selected dropdown option.
     */
    function updateSearchResult(selectedText) {
        searchResult.textContent = selectedText || "None"; // Default to "None" if empty
    }

    /**
     * Saves the selected search type to localStorage.
     * @param {string} value - The value of the selected dropdown option.
     */
    function saveSearchType(value) {
        localStorage.setItem(STORAGE_KEY, value); // Save the value to localStorage
    }

    /**
     * Loads the saved search type from localStorage and updates the dropdown and display.
     */
    function loadSearchType() {
        const hasVisited = sessionStorage.getItem("hasVisited"); // Check if user has been on the page
        const savedValue = localStorage.getItem(STORAGE_KEY); // Get last selected option

        console.log("Session Storage (Has Visited):", hasVisited);
        console.log("Saved Value in LocalStorage:", savedValue);

        if (!hasVisited) {
            // First visit or refresh → Reset to "- None -"
            sessionStorage.setItem("hasVisited", "true"); // Mark the page as visited
            localStorage.removeItem(STORAGE_KEY); // Clear saved selection
            searchTypeDropdown.value = ""; // Reset dropdown
            console.log("First visit or refresh. Resetting dropdown to - None -");
        } else if (savedValue) {
            // If user has selected something before, keep that selection
            searchTypeDropdown.value = savedValue;
            console.log("Dropdown set to previously selected value:", savedValue);
            handleDropdownChange({ target: searchTypeDropdown });  // Ensure correct field visibility
        } else {
            searchTypeDropdown.value = ""; // Default to "- None -"
            console.log("No saved selection. Resetting to - None -");
        }
    }


    // 3. Event Handlers
    /**
     * Handles the dropdown's change event.
     * @param {Event} event - The change event triggered by the dropdown.
     */
    function handleDropdownChange(event) {
        const selectedOption = event.target.options[event.target.selectedIndex]; // Get selected option
        const selectedText = selectedOption.text; // Get the text of the selected option
        const selectedValue = selectedOption.value; // Get the value of the selected option

        updateSearchResult(selectedText); // Update the displayed search type
        saveSearchType(selectedValue); // Save the selected value

        // Show/Hide Common Name Input
        if (selectedValue === "common-name") {
            commonNameContainer.style.display = "block"; // Show the text input
            scientificNameContainer.style.display = "none"; // Hide scientific name input
            scientificNameInput.value = "";  // Clear scientific name input
        } else if (selectedValue === 'scientific-name') {
            scientificNameContainer.style.display = "block"; // Hide scientific name input
            commonNameContainer.style.display = "none";  // Hide the text input for other options
            commonNameInput.value = ""; // Clear the input field when hidden
        } else {
            // Hide both inputs if "All Sightings" or "None" is selected
            commonNameContainer.style.display = "none";
            scientificNameContainer.style.display = "none";
            commonNameInput.value = "";       // Clear common name input
            scientificNameInput.value = "";   // Clear scientific name input
        }
    }

    // 4. Initialize the Page
    loadSearchType(); // Load the saved search type on page load

    // 5. Event Listener
    searchTypeDropdown.addEventListener("change", handleDropdownChange);

    // 6. Service Worker Registration
    if ("serviceWorker" in navigator) {
        window.addEventListener("load", function () {
            navigator.serviceWorker
                .register("static/js/serviceworker.js")
                .then((res) => console.log("service worker registered"))
                .catch((err) => console.log("service worker not registered", err));
    });
}
})();
