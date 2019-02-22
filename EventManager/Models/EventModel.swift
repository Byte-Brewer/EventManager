//
//  EventModel.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/10/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import Foundation

class EventModel {
    var arrayOfEvents = [Event]()
    
    init(count: Int) {
        arrayOfEvents.append(Event.init(name: "Cosmology - The Next Decade", place: "Bangalore, India", date: "ongoing", info: """
Abstract: We are at a very exciting time in cosmology as we make new proposals for cosmological experiments and wait for the next generation of the already approved experiments to become operational. The nature of data that will be provided by the next generation of cosmological experiments would be overwhelming quantitatively (in the case of large scale structure surveys) and very different from the current data sets qualitatively (in the case of the CMB spectral distortions and polarization and 21 cm experiments). There are also large gaps — mainly driven by astrophysical uncertainties in our theoretical understanding of the large scale structure; these must be filled in order to get the full benefit of these new data sets.
""", isHere: true, friendsCount: 5))
        for _ in 0...count {
            let newEvent = Event.init(name: arrayOfName[Int.random(in: 0..<arrayOfName.count)], place: arrayOfPlace[Int.random(in: 0..<arrayOfPlace.count)], date: arrayOfDate[Int.random(in: 0..<arrayOfDate.count)], info: arrayOfInfo[Int.random(in: 0..<arrayOfInfo.count)], isHere: arrayOfIsHere[Int.random(in: 0..<arrayOfIsHere.count)], friendsCount: Int.random(in: 1...12))
            arrayOfEvents.append(newEvent)
        }
    }
    
    private var arrayOfName = ["Mule Soft Connect", "WWDC19", "Multi-State Payroll Compliance ", "Coping with Change without Stress", "CES 2019"]
    private var arrayOfPlace = ["San Francisco, CA", "Aurora, CO , United States of America", "Fremont , United States of America", "Washington, DC", "Dubai , United Arab Emirates", "Thailand , Kenya", "Vancouver , Canada"]
    private var arrayOfDate = ["January 20-23", "February 16-19", "February 14-17", "January 15-18", "February 19-22", " 09-11 Jan 2019"]
    private var arrayOfInfo = ["A premier integration conference for CIOs, IT Leader and technologists to address the challenges of the new digital era.", "eCommerce Conferences bring together prominent speakers, inspiring leaders, ecommerce scholars & delegates, across the horizon from various industries to a platform to discuss & share about the transformative, penetrating e-commerce business; insightful journeys and challenges", "Economics conferences provide opportunities for economists, academicians and researchers along-with professionals, policy makers, research scholar and practitioners from various fields in economics to present their research contributions, experience and ideas, on a single forum and interact with members inside and outside their own particular disciplines.", "The human resource conferences provide great opportunity to enhance learning, human potential, and high performance in work related systems and contribute to sustainable human resource development.", "General objective of Management Conferences is to facilitate an open and constructive dialogue between researchers and practitioners based on research works and practical experiences which foster a better understanding of the world’s best management policies practices.", "The fundamental purpose of Marketing Conferences is to discover solutions for streamlining information-exchange processes, improving support capacities, gain an arsenal of new marketing techniques, tips, savvy suggestions, great ideas, little-known secrets, smart how-tos, and best practices to identify market sentiments."]
    private var arrayOfIsHere = [false, false, false, false, false]
}

struct Event {
    let name: String
    let place: String
    let date: String
    let info: String
    let isHere: Bool
    let friendsCount: Int
}
