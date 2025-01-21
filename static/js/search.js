// File: search.js
// Description: Handles dropdown interactivity on the search page for displaying and saving the chosen search type.
// Author: Carlie Weatherby
// Date: January 2025

// Wrap code in an IIFE to prevent polluting the global namespace
(function () {
    "use strict"; // Enforce stricter parsing and error handling

    // 1. Variable Declarations
    const searchTypeDropdown = document.getElementById("search-type"); // Dropdown element
    const searchResult = document.getElementById("search-result"); // Output element
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
        const savedValue = localStorage.getItem(STORAGE_KEY); // Retrieve the saved value
        if (savedValue) {
            searchTypeDropdown.value = savedValue; // Set the dropdown to the saved value
            const selectedText = searchTypeDropdown.options[searchTypeDropdown.selectedIndex].text;
            updateSearchResult(selectedText); // Update the display
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
    }

    // 4. Initialize the Page
    loadSearchType(); // Load the saved search type on page load

    // 5. Event Listener
    searchTypeDropdown.addEventListener("change", handleDropdownChange);
})();
