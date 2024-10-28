//
//  ApiManager.swift
//  Clima
//
//  Created by R Unnikrishnan on 26/10/24.
//
//

import Foundation

protocol weatherManagerDelegate
{
    func didUpdateWeather(weather:WeatherModel)
    func didUpdateError(error:Error)
}

struct WeatherManager
{
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=86ad4eb28e184939bc34828f7f5e8a26&units=metric"
    
    func fetchWeatherData(city:String)
    {
        let UrlString = "\(weatherUrl)&q=\(city)"
        performRequest(urlString: UrlString)
    }
    
    var weatherDelegate:weatherManagerDelegate?
    
    func performRequest(urlString:String)
    {
        //1.Create a Url
        if let url = URL(string: urlString)
        {
            //2.Create a Url Session
            let session = URLSession(configuration: .default)
            //3.Give Session a task
            let task = session.dataTask(with: url) { data, responce, error in
                if error != nil{
                    print(error!)
                    self.weatherDelegate?.didUpdateError(error: error!)
                    return
                }
                if let safedata = data
                {
                    if  let weather = parseJson(weatherData: safedata)
                    {
                        self.weatherDelegate?.didUpdateWeather(weather: weather)
                    }
                }
                
            }
            //4.Start the task
            task.resume()
            
        }
    }
    func parseJson(weatherData:Data) -> WeatherModel?
    {
        let decoder = JSONDecoder()
        do
        {
            let decodedData = try  decoder.decode(WeatherData.self, from: weatherData)
            let weatherID = decodedData.weather[0].id
            let cityName = decodedData.name
            let cityTemperature = decodedData.main.temp
            let weather = WeatherModel(conditionID: weatherID, cityName: cityName, temperature: cityTemperature)
            print(weather.conditionName)
            print("temperature\(weather.temperature)")
            return weather
        }
        catch
        {
            print(error)
            self.weatherDelegate?.didUpdateError(error: error)
            return nil
        }
    }
    
    
}
