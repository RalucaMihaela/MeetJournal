//
//  PersonViewModel.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 30/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import Combine
import CoreData
import UIKit
import CoreLocation

final class PersonViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager
    @Published var latestLocation: String = ""
    
    private var managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
     func addNewPerson(name: String, location: String, comment: String) throws {
        if name.isEmpty && location.isEmpty {
            throw CoreDataError.invalidItems
        }
        
        guard name.isEmpty == false else {
            throw CoreDataError.invalidName
        }
        
        guard location.isEmpty == false else {
            throw CoreDataError.invalidLocation
        }
        
        let newPerson = History(context: self.managedObjectContext)
        newPerson.name = name
        newPerson.location = location
        newPerson.comment = comment
        newPerson.date = Date()
        newPerson.id = UUID()
        
        do {
            try self.managedObjectContext.save()
        } catch {
            throw CoreDataError.coreDataError
        }
    }
    
    // MARK: Location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if (error != nil){
                print("error in reverseGeocode")
            }
            let placemark = placemarks! as [CLPlacemark]
            if placemark.count>0{
                let placemark = placemarks![0]
            
                if let city = placemark.locality, let street = placemark.thoroughfare {
                     self.latestLocation = "\(street) , \(city) "
                }
            }
        }
    }
}
