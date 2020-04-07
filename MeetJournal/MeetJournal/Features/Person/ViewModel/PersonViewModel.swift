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
        
        guard !name.isEmpty else {
            throw CoreDataError.invalidName
        }
        
        guard !location.isEmpty else {
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
            
            guard let location = placemarks?.first else {
                return
            }
            
            if let city = location.locality,
                let street = location.thoroughfare {
                
                if let number = location.subThoroughfare {
                    self.latestLocation = "\(street) \(number), \(city) "
                } else {
                    self.latestLocation = "\(street), \(city) "
                }
            }
        }
        
    }
}
