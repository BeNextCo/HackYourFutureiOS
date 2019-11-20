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

class EventProvider {
    private let repository: EventListRepositoryProtocol

    init(repository: EventListRepositoryProtocol) {
        self.repository = repository
    }
}

// MARK: -

extension EventProvider: EventProviderProtocol {
    func requestEvents() -> Observable<[Event]> {
        return Observable.create { observer in
            self.repository.retrieveData { (response) in
                switch response {
                case .success(let events):
                    observer.on(.next(events))
                     observer.on(.completed)
                case .failure(let error):
                    observer.on(.error(error))
                }
            }
            return Disposables.create()
        }
    }
}
