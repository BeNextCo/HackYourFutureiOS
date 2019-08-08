//
//  EventProvider.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import RxSwift

protocol EventProviderProtocol {
    func requestEvents() -> Observable<[Event]>
}

class EventProvider: EventProviderProtocol {
    func requestEvents() -> Observable<[Event]> {
        return .just([])
    }
}
