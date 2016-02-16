//
//  Weather.swift
//  weather
//
//  Created by Benjamin SENECHAL on 02/02/2016.
//  Copyright © 2016 Rémi Delhaye. All rights reserved.
//

import Foundation

final class Weather : ResponseCollectionSerializable, ResponseObjectSerializable {
    private var _date : Int!, _temperature : Double!, _weatherDescription : String!
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        _date = representation.valueForKeyPath("dt") as? Int
        _temperature = representation.valueForKeyPath("temp.day") as? Double
        
        for weather in representation.valueForKeyPath("weather") as! [AnyObject]{
            _weatherDescription = weather.valueForKeyPath("description") as? String
        }
    }
    
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Weather] {
        var weathers: [Weather] = []
        
        if let representation = representation as? [[String: AnyObject]] {
            for userRepresentation in representation {
                if let user = Weather(response: response, representation: userRepresentation) {
                    weathers.append(user)
                }
            }
        }
        return weathers
    }
}