//
//  ABN_Amro_Test_AppTests.swift
//  Deep Linking AppTests
//
//  Created by Esra Dursun on 23/04/2020.
//  Copyright © 2020 Esra Dursun. All rights reserved.
//

import XCTest
@testable import ABN_Amro_Test_App

class ABN_Amro_Test_AppTests: XCTestCase {
    
    private var mockUIApplication : MockUIApplication!
    private var externalAppManager : ExternalAppManager!
    
    
    override func setUp() {
        super.setUp()
        
        self.mockUIApplication = MockUIApplication()
        self.externalAppManager = ExternalAppManager()
        self.externalAppManager.setUIApplication(self.mockUIApplication)
    }
    
    func testApp_isOpenUrl_throughUIApplication(){
        let url = URL(string: Constants.wikipediaAppUrl)!
        self.externalAppManager.callWikipediaPlaces(url)
      
        XCTAssert(self.mockUIApplication.isOpen)
        XCTAssertEqual(self.mockUIApplication.openedUrl, url)
    }

    func testApp_isNotOpenUrl_throughUIApplication(){
        self.mockUIApplication.canOpen = false
        self.externalAppManager.callWikipediaPlaces(URL(string: "fake_url")!)
      
        XCTAssert(!self.mockUIApplication.isOpen)
        XCTAssertEqual(self.mockUIApplication.openedUrl, URL(string: Constants.websiteUrl)!)
    }

}
