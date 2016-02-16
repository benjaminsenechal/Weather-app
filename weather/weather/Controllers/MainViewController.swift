//
//  ViewController.swift
//  weather
//
//  Created by Benjamin SENECHAL on 02/02/2016.
//  Copyright © 2016 Rémi Delhaye. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        WeatherManager().retrieveWeather { (City, errorMessage) -> Void in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

