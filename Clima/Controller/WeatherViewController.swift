//
//  ViewController.swift
//  Clima
//
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var serachFeild: UITextField!
    @IBOutlet weak var serachButton: UIButton!
    var weatherManager = WeatherManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        serachFeild.delegate = self
        weatherManager.weatherDelegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func searchAction(_ sender: UIButton)
    {
        if let cityName = serachFeild.text
        {
            weatherManager.fetchWeatherData(city: cityName)
        }
    }
    

}

extension WeatherViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //to make the ekeyboard close itslef after the editing
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        //to make the seacrh feild empty after editing or after pressing the enter
        serachFeild.text = ""
        
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        //delegate method to do validation code on the textfield
        if textField.text!.isEmpty
        {
            return true
        }
        else
        {
            textField.placeholder = "Should enter any city name"
            return false
        }
    }
}

extension WeatherViewController:weatherManagerDelegate
{
    func didUpdateWeather(weather: WeatherModel)
    {
        DispatchQueue.main.async { [self] in
            temperatureLabel.text = weather.temperartureString
            conditionImageView.image = UIImage(named: weather.conditionName)
            cityLabel.text = weather.cityName
        }
    }
    func didUpdateError(error: any Error) {
        print("error Found\(error)")
    }
    
}
