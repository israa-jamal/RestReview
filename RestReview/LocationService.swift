//
//  LocationService.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/25/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import Foundation
import CoreLocation

enum Result<T>{
    case success(T)
    case failure(Error)
}

final class LocationService: NSObject{
    private let manger : CLLocationManager
    init(manager: CLLocationManager = .init()) {
        self.manger = manager
        super.init()
        manager.delegate = self
    }
    
    var newLocation: ((Result<CLLocation>) -> Void)?
    var didChangeStatus: ((Bool) -> Void)?

    var status : CLAuthorizationStatus{
        return CLLocationManager.authorizationStatus()
    }
}
extension LocationService: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        newLocation?(.failure(error))
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //sort location by timestamp and return the first one to new location variable
        if let location = locations.sorted(by: {$0.timestamp > $1.timestamp}).first{
            newLocation?(.success(location))
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            didChangeStatus?(false)
        default:
            didChangeStatus?(true)
        }
    }
}
