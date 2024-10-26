//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var serachFeild: UITextField!
    @IBOutlet weak var serachButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        serachFeild.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func searchAction(_ sender: UIButton)
    {
        print("SearchFeild Text\(serachFeild.text!)")
    }
    

}

extension WeatherViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        //to make the ekeyboard close itslef after the editing
        textField.resignFirstResponder()
        print(textField.text!   )
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
