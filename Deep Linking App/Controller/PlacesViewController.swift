//
//  ViewController.swift
//  Deep Linking App
//
//  Created by Esra Dursun on 23/04/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController {

    var placesVM = PlacesViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesVM.filteredData = placesVM.places
        searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension PlacesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = placesVM.getModelAt(indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = item.location
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let placeName = placesVM.filteredData[indexPath.row].location
        placesVM.callWikipediaPlacesWith(locationName: placeName)
    }
}

extension PlacesViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let locationName = searchBar.text else {
            return
        }
        placesVM.callWikipediaPlacesWith(locationName: locationName)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        placesVM.filteredData = searchText.isEmpty ? placesVM.places : placesVM.places.filter({ (place : Place) -> Bool in
            return place.location.range(of: searchText, options: .caseInsensitive) != nil
        })
        tableView.reloadData()
    }
}
