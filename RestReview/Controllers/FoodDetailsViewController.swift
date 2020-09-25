//
//  FoodDetailsViewController.swift
//  RestReview
//
//  Created by Esraa Gamal on 9/25/20.
//  Copyright © 2020 Esraa Gamal. All rights reserved.
//

import UIKit
import MapKit
class FoodDetailsViewController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!

    @IBAction func handleControl(_ sender: UIPageControl) {
    }
    //    @IBOutlet weak var foodDetails: FoodDetailsView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
