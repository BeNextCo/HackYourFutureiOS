//
//  Event.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation

struct Event: Codable {
    let title: String
    let imageUrl: String
    let startDate: String //@TODO: Change by date and use `dateDecodingStrategy`
    let endDate: String //@TODO: Change by date and use `dateDecodingStrategy`
//    let address: String?
//    let attendees: [Int]?

    enum CodingKeys: String, CodingKey {
        case imageUrl = "image_url"
        case startDate = "date_begin"
        case endDate = "date_end"
        case title
    }
}
