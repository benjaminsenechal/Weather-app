//
//  City.swift
//  weather
//
//  Created by Benjamin SENECHAL on 02/02/2016.
//  Copyright © 2016 Rémi Delhaye. All rights reserved.
//

import Foundation

class City : ResponseObjectSerializable {
    private var _cityId : Int!, _latitude : Double!, _longitude : Double!, _city : String!, _weathers:[Weather]!
    
    var cityId : Int{
        get{
            return _cityId
        }
    }
    
    var latitude : Double {
        get{
            return _latitude
        }
    }
    
    var longitude : Double {
        get{
            return _longitude
        }
    }

    var city : String {
        get{
            return _city
        }
    }
    
    var weathers : [Weather] {
        get {
            return _weathers
        }
    }
    
    required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        _cityId = representation.valueForKeyPath("city.id") as? Int
        _city = representation.valueForKeyPath("city.name") as? String
        _longitude = representation.valueForKeyPath("city.coord.lon") as? Double
        _latitude = representation.valueForKeyPath("city.coord.lat") as? Double
        _weathers = Weather.collection(response: response, representation: representation.valueForKeyPath("list")!)
        //
    }
}