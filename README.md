Clima - Weather App

Overview

Clima is a weather app for iOS that provides real-time weather updates for cities worldwide. Users can enter the name of a city, and Clima will display the current temperature, weather condition, and other related information. The app uses the MVC architecture and incorporates UITextFieldDelegate and a custom weatherManagerDelegate to manage weather data and handle UI interactions effectively.

Features

	•	Real-time weather updates for any city.
	•	Display of current temperature, weather condition icon, and city name.
	•	Error handling for incorrect city names.
	•	Intuitive UI that clears the search field after each entry.

Requirements

	•	iOS 13.0+
	•	Xcode 12+
	•	Swift 5.0+
	•	API key from a weather service provider like OpenWeather (ensure to replace any placeholders with your actual API key in WeatherManager).

 Usage

	1.	Enter a city name in the search field.
	2.	Tap the Search button to fetch the weather data for that city.
	3.	The app displays the temperature, weather condition icon, and city name if the city is found.

Code Explanation

Main Classes

	•	WeatherViewController: The primary view controller managing user interaction and displaying weather data.
	•	WeatherManager: Handles API requests to fetch weather data.
	•	WeatherModel: Stores and formats weather data for display.

Key Methods

	1.	viewDidLoad() - Initializes delegates and sets up the view.
	2.	searchAction(_:) - Triggered when the user taps the Search button, fetching data for the entered city.
	3.	textFieldShouldReturn(_:) - Closes the keyboard after entering the city name.
	4.	didUpdateWeather(weather:) - Updates UI with the fetched weather data.

Delegates

	•	UITextFieldDelegate: Manages the search field behavior, including placeholder text and keyboard dismissal.
	•	weatherManagerDelegate: Manages data retrieval from WeatherManager and handles UI updates on the main thread.

Example Usage

To retrieve weather data for New York, type “New York” in the search field and tap Search. The app will display the current temperature, weather condition icon, and city name in real-time.

Known Issues

	•	Ensure the API key is valid and entered correctly; otherwise, API calls will fail.
	•	If a city is not found, an error message will be printed in the console.

License

This project is licensed under the MIT License.
