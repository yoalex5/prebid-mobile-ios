//
//  NativeRequestTests.swift
//  PrebidMobileTests
//
//  Created by Akash Verma on 17/10/19.
//  Copyright © 2019 AppNexus. All rights reserved.
//

import XCTest
@testable import PrebidMobile

class NativeRequestTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNativeAdUnitCreation() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNotNil(nativeUnit)
        XCTAssertTrue(nativeUnit.prebidConfigId == Constants.configID1)
    }
    
    func testNativeAdContextType() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNil(nativeUnit.context)
        nativeUnit.context = ContextType.Social
        XCTAssertNotNil(nativeUnit.context)
        XCTAssertTrue(nativeUnit.context == ContextType.Social)
        nativeUnit.context = ContextType.Product
        XCTAssertTrue(nativeUnit.context == ContextType.Product)
        nativeUnit.context = ContextType.Content
        XCTAssertTrue(nativeUnit.context == ContextType.Content)
        nativeUnit.context = ContextType.TBD
        XCTAssertTrue(nativeUnit.context == ContextType.TBD)
    }
    
    func testNativeAdContextSubType() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNil(nativeUnit.contextSubType)
        nativeUnit.contextSubType = ContextSubType.General
        XCTAssertNotNil(nativeUnit.contextSubType)
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.General)
        nativeUnit.contextSubType = ContextSubType.Article
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.Article)
        nativeUnit.contextSubType = ContextSubType.Video
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.Video)
        nativeUnit.contextSubType = ContextSubType.Audio
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.Audio)
        nativeUnit.contextSubType = ContextSubType.Image
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.Image)
        nativeUnit.contextSubType = ContextSubType.UserGenerated
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.UserGenerated)
        nativeUnit.contextSubType = ContextSubType.Social
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.Social)
        nativeUnit.contextSubType = ContextSubType.email
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.email)
        nativeUnit.contextSubType = ContextSubType.chatIM
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.chatIM)
        nativeUnit.contextSubType = ContextSubType.SellingProduct
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.SellingProduct)
        nativeUnit.contextSubType = ContextSubType.AppStore
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.AppStore)
        nativeUnit.contextSubType = ContextSubType.ReviewSite
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.ReviewSite)
        nativeUnit.contextSubType = ContextSubType.TBD
        XCTAssertTrue(nativeUnit.contextSubType == ContextSubType.TBD)
    }
    
    func testNativeAdPlacementType() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNil(nativeUnit.placementType)
        nativeUnit.placementType = PlacementType.FeedContent
        XCTAssertNotNil(nativeUnit.placementType)
        XCTAssertTrue(nativeUnit.placementType == PlacementType.FeedContent)
        nativeUnit.placementType = PlacementType.AtomicContent
        XCTAssertTrue(nativeUnit.placementType == PlacementType.AtomicContent)
        nativeUnit.placementType = PlacementType.OutsideContent
        XCTAssertTrue(nativeUnit.placementType == PlacementType.OutsideContent)
        nativeUnit.placementType = PlacementType.RecommendationWidget
        XCTAssertTrue(nativeUnit.placementType == PlacementType.RecommendationWidget)
        nativeUnit.placementType = PlacementType.TBD
        XCTAssertTrue(nativeUnit.placementType == PlacementType.TBD)
    }
    
    func testNativeAdPlacementCount() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertTrue(nativeUnit.placementCount == 1)
        nativeUnit.placementCount = 123
        XCTAssertTrue(nativeUnit.placementCount == 123)
    }
    
    func testNativeAdSequence() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertTrue(nativeUnit.sequence == 0)
        nativeUnit.sequence = 1
        XCTAssertTrue(nativeUnit.sequence == 1)
    }
    
    func testNativeAdAsseturlSupport() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertTrue(nativeUnit.asseturlsupport == 0)
        nativeUnit.asseturlsupport = 1
        XCTAssertTrue(nativeUnit.asseturlsupport == 1)
    }
    
    func testNativeAdDUrlSupport() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertTrue(nativeUnit.durlsupport == 0)
        nativeUnit.durlsupport = 1
        XCTAssertTrue(nativeUnit.durlsupport == 1)
    }
    
    func testNativeAdPrivacy() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertTrue(nativeUnit.privacy == 0)
        nativeUnit.privacy = 1
        XCTAssertTrue(nativeUnit.privacy == 1)
    }
    
    func testNativeAdExt() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNil(nativeUnit.ext)
        nativeUnit.ext = 123 as AnyObject
        XCTAssertNotNil(nativeUnit.ext)
        let ext = ["key" : "value"]
        nativeUnit.ext = ext as AnyObject
        if let data = nativeUnit.ext as? [String : String], let value = data["key"] {
            XCTAssertTrue(value == "value")
        }
    }
    
     func testNativeAdEventTrackers() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNil(nativeUnit.eventtrackers)
        let eventTrackers1 = NativeEventTracker(event: EventType.Impression, methods: [EventTracking.Image,EventTracking.js])
        let eventTrackers2 = NativeEventTracker(event: EventType.ViewableImpression50, methods: [EventTracking.TBD,EventTracking.Image])
        nativeUnit.eventtrackers = [eventTrackers1, eventTrackers2]
        XCTAssertNotNil(nativeUnit.eventtrackers)
        XCTAssertTrue(nativeUnit.eventtrackers?.count == 2)
        if let eventTrackerArray = nativeUnit.eventtrackers{
            if eventTrackerArray.count == 1 {
                let eventTracker = eventTrackerArray[0]
                if let event = eventTracker.event
                {
                    XCTAssertTrue(event == EventType.Impression)
                }
                if let methods = eventTracker.methods
                {
                    XCTAssertTrue(methods.count == 2)
                    XCTAssertTrue(methods[0] == EventTracking.Image)
                    XCTAssertTrue(methods[1] == EventTracking.js)
                }
            }
            if eventTrackerArray.count == 2 {
                let eventTracker = eventTrackerArray[1]
                if let event = eventTracker.event
                {
                    XCTAssertTrue(event == EventType.ViewableImpression50)
                }
                if let methods = eventTracker.methods
                {
                    XCTAssertTrue(methods.count == 2)
                    XCTAssertTrue(methods[0] == EventTracking.TBD)
                    XCTAssertTrue(methods[1] == EventTracking.Image)
                }
            }
        }
    }
    
    func testNativeAdAssets() {
        let nativeUnit = NativeRequest(configId: Constants.configID1)
        XCTAssertNil(nativeUnit.assets)
        let assets = NativeAsset()
        assets.title = NativeAssetTitle(length:25)
        assets.image = NativeAssetImage(minimumWidth: 20, minimumHeight: 30)
        nativeUnit.assets = [assets]
        XCTAssertNotNil(nativeUnit.assets)
        XCTAssertTrue(nativeUnit.assets?.count == 1)
        if let assets = nativeUnit.assets{
            if assets.count == 1 {
                let asset = assets[0]
                if let title = asset.title
                {
                    XCTAssertTrue(title.length == 25)
                }
                if let image = asset.image
                {
                    XCTAssertTrue(image.widthMin == 20)
                    XCTAssertTrue(image.heightMin == 30)
                }
            }
        }
    }
    
}
