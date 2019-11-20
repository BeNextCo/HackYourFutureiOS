//
//  hackYourFutureTests.swift
//  hackYourFutureTests
//
//  Created by Thibaut Coutard on 07/08/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import XCTest
import RxSwift

@testable import hackYourFuture

private typealias ResultatDuViewModel = [EventListCellViewModelProtocol]

class hackYourFutureTests: XCTestCase {

    private var provider: EventProviderMock!
    private var viewModel: EventListViewModel!

    private var results = [ResultatDuViewModel]()
    private let disposeBag = DisposeBag()

    override func setUp() {
        results = []

        provider = EventProviderMock()
        viewModel = EventListViewModel(provider: provider)

        viewModel.cellViewModels
            .subscribe(onNext: { [weak self] (cellViewModels) in
                self?.results.append(cellViewModels)
            })
            .disposed(by: disposeBag)
    }

    func test_() {
        // Given
        provider.events = []

        // When
        viewModel.fetchEvents()

        // Then
        XCTAssertTrue(results.count == 1)
        XCTAssertTrue(results.first?.count == 0)
    }

    func test_2() {
        // Given
        provider.events = []

        // When
        viewModel.fetchEvents()

        provider.events = [
            hackYourFuture.Event(title: "", imageUrl: "", startDate: "", endDate: ""),
            hackYourFuture.Event(title: "", imageUrl: "", startDate: "", endDate: "")
        ]
        viewModel.fetchEvents()

        // Then
        XCTAssertTrue(results.count == 2)
        XCTAssertTrue(results[0].count == 0)
        XCTAssertTrue(results[1].count == 2)
    }
}

class EventProviderMock: EventProviderProtocol {

    var events = [hackYourFuture.Event]()

    func requestEvents() -> Observable<[hackYourFuture.Event]> {
        return .just(events)
    }
}
