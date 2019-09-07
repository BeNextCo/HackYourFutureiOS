//
//  EventListViewModel.swift
//  hackYourFuture
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import RxSwift

/// sourcery: AutoMockable
protocol EventListViewModelProtocol {
    var cellViewModels: Observable<[EventListCellViewModelProtocol]> { get }

    func fetchEvents()
}

class EventListViewModel {

    private let provider: EventProviderProtocol
    private let disposeBag: DisposeBag
    private let cellViewModelsSubject = PublishSubject<[EventListCellViewModelProtocol]>()
    let cellViewModels: Observable<[EventListCellViewModelProtocol]>

    init(provider: EventProviderProtocol) {
        self.provider = provider
        self.cellViewModels = cellViewModelsSubject.asObservable()
        disposeBag = DisposeBag()
    }

    func fetchEvents() {
        provider
            .requestEvents()
            .map({ (events) -> [EventListCellViewModelProtocol] in
                return events.map { EventListCellViewModel(event: $0) }
            })
            .subscribe(onNext: {[weak self] (events) in
                self?.cellViewModelsSubject.onNext(events)
            }, onError: { (error) in
                //@TODO:
            })
            .disposed(by: disposeBag)
    }
}

extension EventListViewModel: EventListViewModelProtocol {
}
