//
//  EventListCellViewModel.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation

/// sourcery: AutoMockable
protocol EventListCellViewModelProtocol {
    var title: String { get }
    var imageUrl: String { get }
    var attendees: Int { get }
    var date: String { get }
    var address: String { get }
}

class EventListCellViewModel: EventListCellViewModelProtocol {
    let title: String
    let imageUrl: String
    let attendees: Int
    let date: String
    let address: String

    init(event: Event) {
        self.title = event.title
        self.imageUrl = event.imageUrl
        self.attendees = event.attendees
        self.date = "10 pm"
        self.address = event.address
    }
}
