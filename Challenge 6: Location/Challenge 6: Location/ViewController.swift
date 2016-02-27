//
//  ViewController.swift
//  Challenge 6: Location
//
//  Created by Joacim Nidén on 27/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var location:String?
    let locationManager = CLLocationManager() //Load the location service

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func getLocationButton(sender: UIButton) {
        
        //ask for permissions to always use
        locationManager.requestAlwaysAuthorization()
        
        //only use when it's needed
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            
        }else{
            positionLabel.text = "Location Service not available"
        }

        
    }
    
    @IBOutlet weak var positionLabel: UILabel!
    
    //Checks update
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error) -> Void in
            if (error != nil) {
                print("Reverse geocoder failed with error" + error!.localizedDescription)
                return
            }
            
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
        
    }
    
    //Error handler for location manager
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error location" + error.localizedDescription)
    }
    
    //This handles the display of location
    func displayLocationInfo(placemark: CLPlacemark) {

        locationManager.stopUpdatingLocation()
        self.location = String(placemark.locality!+", "+placemark.country!)
        
        //It needs to be put here, otherwise you need to click twice
        positionLabel.text = location
        
        //Locate on map
        locateOnMap()
        
    }
    
    //Map location
    func locateOnMap(){

        //Handles the map
        let lat = locationManager.location?.coordinate.latitude
        let long = locationManager.location?.coordinate.longitude
        let initialLocation = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: initialLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        //Handles the pin
        let pin = Pin(
            title:location!,
            coordinate: CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        )
        
        mapView.addAnnotation(pin)
        
    }

    
    //http://rshankar.com/get-your-current-address-in-swift/ 
    //http://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial
    //http://www.ioscreator.com/tutorials/mapkit-tutorial-swift-ios8
    


}

