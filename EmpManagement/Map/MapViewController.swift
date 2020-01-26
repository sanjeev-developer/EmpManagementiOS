//  MapViewController.swift
//  Created by sanjeev gupta on 2020-01-22.
//  Copyright © 2020 sanjeev gupta. All rights reserved.

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate{
    
    var locationManager = CLLocationManager()
    var destination2d = CLLocationCoordinate2D()
    
    @IBOutlet var selectbutton: UIButton!
    @IBOutlet var zoomStepperOutlet: UIStepper!
    var transport = false
    @IBOutlet var mapView: MKMapView!
    var addbillcontroller:AddBillViewController?
    var latlabel = "";
    var longlabel = "";
    var country = "";
    var state = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mapView.delegate = self

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
         
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        zoomStepperOutlet.value = 0
        zoomStepperOutlet.minimumValue = -5
        zoomStepperOutlet.maximumValue = 5
        
        selectbutton.layer.cornerRadius = 10.0
        selectbutton.layer.shadowColor = UIColor.gray.cgColor
        selectbutton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        selectbutton.layer.shadowRadius = 12.0
        selectbutton.layer.shadowOpacity = 0.7
        
        let gestureDoubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        gestureDoubleTap.numberOfTapsRequired = 2
        mapView.addGestureRecognizer(gestureDoubleTap)
    }
    
    
    @IBAction func selectlocation(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        addbillcontroller?.userlocation(countrylabel: country, lattlabel: latlabel , longglabel: longlabel, state:state)
    }
    
    
    @IBAction func backmap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func mapZoomStepper(_ sender: UIStepper) {
           
           if sender.value < 0
                  {
                      var region: MKCoordinateRegion = mapView.region
                      region.span.latitudeDelta = min(region.span.latitudeDelta * 2.0, 180.0)
                      region.span.longitudeDelta = min(region.span.longitudeDelta * 2.0, 180.0)
                      mapView.setRegion(region, animated: true)
                      zoomStepperOutlet.value = 0
                  }
                  else
                  {
                      var region: MKCoordinateRegion = mapView.region
                      region.span.latitudeDelta /= 2.0
                      region.span.longitudeDelta /= 2.0
                      mapView.setRegion(region, animated: true)
                      zoomStepperOutlet.value = 0
                  }
       }
    
        
        @objc func doubleTap(gestureRecognizer : UILongPressGestureRecognizer)
        {
            let count = mapView.overlays.count
            if count != 0
            {
                mapView.removeOverlays(mapView.overlays)
            }
            
            //remove annotations
            let i = mapView.annotations.count
            if i != 0
            {
            let annotationsToRemove = mapView.annotations.filter { $0 !== mapView.userLocation }
            mapView.removeAnnotations( annotationsToRemove )
            }
        
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            let annotation = MKPointAnnotation()
            // annotation.title = "Latitude:\(coordinate.latitude)"
            latlabel = "\(coordinate.latitude)"
            longlabel = "\(coordinate.longitude)"
           
            annotation.subtitle = "Latitude:\(coordinate.latitude) + Longitude:\(coordinate.longitude)"
            annotation.coordinate = coordinate
            destination2d = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
            mapView.addAnnotation(annotation)
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
                  
            CLGeocoder().reverseGeocodeLocation(location){(placemarks, error) in
            if let error = error
            {
                print(error)
            }
            else
            {
                if let placemark = placemarks?[0]{
                    var address = ""
                    if placemark.subThoroughfare != nil{
                        address = address + placemark.subThoroughfare! + "\n"
                    }
                    
                    if placemark.thoroughfare != nil{
                        address = address + placemark.thoroughfare! + "\n"
                    }
                    
                    if placemark.subLocality != nil{
                        address = address + placemark.subLocality!  + "\n"
                        self.state = "\(placemark.subLocality)"
                    }
                    
                    if placemark.subAdministrativeArea != nil{
                        annotation.title = placemark.subAdministrativeArea
                        address = address + placemark.subAdministrativeArea! + "\n"
                    }
                    
                    if placemark.postalCode != nil{
                        address = address + placemark.postalCode! + "\n"
                    }
                    
                    if placemark.country != nil{
                        address = address + placemark.country! + "\n"
                        self.country = "\(placemark.country)"
                    }
                  
                    annotation.title = address
              }
            }
            }
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
            //grab user location
            let userLocation : CLLocation = locations[0]
            let lat = userLocation.coordinate.latitude
            let long = userLocation.coordinate.longitude
            //define delta (difference) of lat and long
            let latDelta : CLLocationDegrees = 0.09
            let longDelta : CLLocationDegrees = 0.09

            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            let location = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let region = MKCoordinateRegion(center: location, span: span)
            // set the region on the map
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
        }
    
    func findroute(user: CLLocationCoordinate2D, destination: CLLocationCoordinate2D, route: transporttype)
    {

        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: user, addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: destination2d, addressDictionary: nil))
        request.requestsAlternateRoutes = false
        
        if route.rawValue == "automobile"
        {
            request.transportType = .walking

        }
        else if route.rawValue == "walking"
        {
            request.transportType = .automobile
        }
        

        let directions = MKDirections(request: request)

        directions.calculate { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }

            let route = unwrappedResponse.routes[0]
            self.mapView.addOverlay(route.polyline)
            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
    }
    }
    
    func walkingHandler(alert: UIAlertAction){
        
        transport = true
        
        let currentlocation = mapView.userLocation
                 let currentlocationcoordinates = CLLocationCoordinate2D(latitude: currentlocation.coordinate.latitude, longitude: currentlocation.coordinate.longitude)
                 let destinationlocation = mapView.annotations
                 let destinationlocationcoordinates = CLLocationCoordinate2D(latitude: destinationlocation[0].coordinate.latitude, longitude: destinationlocation[0].coordinate.longitude)
                 print(String(currentlocationcoordinates.latitude) + " Longitude " + String(currentlocationcoordinates.longitude))
                 print(String(destinationlocationcoordinates.latitude) + " Longitude " + String(destinationlocationcoordinates.longitude))
        
        let count = mapView.overlays.count
                   if count != 0
                   {
                       mapView.removeOverlays(mapView.overlays)
                   }
                 
        findroute(user: currentlocationcoordinates, destination: destinationlocationcoordinates, route: .walking)
        
                 }

       func autoHandler(alert: UIAlertAction){
        
        transport = false
        
        let currentlocation = mapView.userLocation
                 let currentlocationcoordinates = CLLocationCoordinate2D(latitude: currentlocation.coordinate.latitude, longitude: currentlocation.coordinate.longitude)
                 let destinationlocation = mapView.annotations
                 let destinationlocationcoordinates = CLLocationCoordinate2D(latitude: destinationlocation[0].coordinate.latitude, longitude: destinationlocation[0].coordinate.longitude)
                 print(String(currentlocationcoordinates.latitude) + " Longitude " + String(currentlocationcoordinates.longitude))
                 print(String(destinationlocationcoordinates.latitude) + " Longitude " + String(destinationlocationcoordinates.longitude))
        
        let count = mapView.overlays.count
                   if count != 0
                   {
                       mapView.removeOverlays(mapView.overlays)
                   }
                 
        findroute(user: currentlocationcoordinates, destination: destinationlocationcoordinates, route: .automobile)
                   // print("You tapped: \(alert.title)")
                }
    
   

    enum transporttype : String
    {
        case automobile
        case walking
    }
}

