//
//  ExternalAppManager2.swift
//  Deep Linking App
//
//  Created by Esra Dursun on 26/04/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import Foundation
import UIKit

protocol UIApplicationProtocol {
    func canOpenURL(_ url: URL) -> Bool
    func open(_: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any], completionHandler: ((Bool) -> Void)?)
}

extension UIApplication: UIApplicationProtocol {}

let externalAppManager = ExternalAppManager()

class ExternalAppManager {
    private var application : UIApplicationProtocol!
    
    func setUIApplication(_ application: UIApplicationProtocol) {
        self.application = application
    }
    
    func callWikipediaPlaces(_ url : URL) {        
        if self.application.canOpenURL(url) {
            self.application.open(url, options: [:], completionHandler: nil)
        } else {
            let websiteUrl = URL(string: Constants.websiteUrl)!
            self.application.open(websiteUrl, options: [:], completionHandler: nil)
        }
    }
}
