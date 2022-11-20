//
//  LocationManagerCode.swift
//  Weather forecast
//
//  Created by 醒着像睡着 on 11/19/22.
//

import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        
        let url = locationAPIURL
        getLocationData(url)
            .done { location in
                print(location.key)
                print(location.city)
                print(location.state)
                print(location.country)
                
                self.getCurrentWeather(currentWeatherURL).done { currentWeatherModel in
                    print(currentWeatherModel.WeatherText)
                    print(currentWeatherModel.WeatherIcon)
                    print(currentWeatherModel.IsDayTime)
                    print(currentWeatherModel.Temperature)
                }.catch{error in
                    print(error.localizedDescription)
                }
                
                
            }.catch { error in
                print(error.localizedDescription)
            }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
