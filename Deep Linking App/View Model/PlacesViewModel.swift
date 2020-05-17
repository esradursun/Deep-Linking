//
//  PlacesViewModel.swift
//  Deep Linking App
//
//  Created by Esra Dursun on 28/04/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import Foundation
import UIKit

class PlacesViewModel {
    
    var places : [Place]
    var filteredData: [Place]!
    var count : Int {
        return filteredData.count
    }
    
    init() {
        places = [
            Place(location: "Amsterdam"),
            Place(location: "Istanbul"),
            Place(location: "London"),
            Place(location: "Berlin"),
            Place(location: "Barcelona"),
            Place(location: "Munich"),
            Place(location: "Paris"),
            Place(location: "Rome"),
            Place(location: "Vienna"),
        ]
    }
    
    func getModelAt(_ index : Int) -> Place {
        return filteredData[index]
    }

    func callWikipediaPlacesWith(locationName : String){
        let wikipediaApp = "\(Constants.wikipediaAppUrl)\(locationName)"
        let url = URL(string: wikipediaApp)!
        externalAppManager.setUIApplication(UIApplication.shared)
        externalAppManager.callWikipediaPlaces(url)
    }
}
