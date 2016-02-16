//
//  WeatherManager.swift
//  weather
//
//  Created by Benjamin SENECHAL on 02/02/2016.
//  Copyright © 2016 Rémi Delhaye. All rights reserved.
//

import Foundation
import Alamofire

class WeatherManager {
    func retrieveWeather(weatherClosure:((City:City?,errorMessage:String!)->Void)) {
        
        Alamofire.request(.GET, "http://api.openweathermap.org/data/2.5/forecast/daily?q=Lille&appid=44db6a862fba0b067b1930da0d769e98")
            .responseObject { (response: Response<City, NSError>) in
                
                guard response.result.error == nil else {
                    print("error in API login -> " + String(response.result.error!))
                    //                        salesClosure(Sales: nil, errorMessage: response.result.error?.description)
                    return
                }
                debugPrint(response)
                //                    salesClosure(Sales: response.result.value! as [Sale], errorMessage: nil)
        }
    }
    
}

