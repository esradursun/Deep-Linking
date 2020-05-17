//
//  UIApplicationMock.swift
//  Deep Linking AppTests
//
//  Created by Esra Dursun on 26/04/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import Foundation
import UIKit
@testable import ABN_Amro_Test_App

class MockUIApplication: UIApplicationProtocol {
    
    var canOpen: Bool = true
    var isOpen: Bool = false
    var openedUrl: URL?
    
    func open(
        _ url: URL, options: [UIApplication.OpenExternalURLOptionsKey: Any], completionHandler: ((Bool) -> Void)?) {
        if canOpen {
            self.isOpen = true
            self.openedUrl = url
        } else {
            let websiteURL = URL(string: Constants.websiteUrl)!
            self.isOpen = false
            self.openedUrl = websiteURL
        }
    }
 
    func canOpenURL(_ url: URL) -> Bool {
        return canOpen
    }
 
}
