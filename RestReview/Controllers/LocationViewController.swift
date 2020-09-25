//
//  ViewController.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/20/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

//    @IBOutlet weak var foodDetails: LocationView!

    var locationService : LocationService?
    @IBOutlet weak var allowButton: UIButton!
    @IBOutlet weak var denyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.locationService?.didChangeStatus = {[weak self] success in
            if success {
                self?.locationService?.getLocation()
            }
        }
        self.locationService?.newLocation = { [weak self] result in
            switch result {
            case .success(let location):
                print(location)
            case .failure(let error):
                assertionFailure("Error getting user location \(error)")
            }
        }
    }

    
    @IBAction func allowPressed(_ sender: UIButton) {
        self.locationService?.requestLocationAuthorization()
        print("did press")
    }
    @IBAction func denyPressed(_ sender: UIButton) {
    }
    
}

