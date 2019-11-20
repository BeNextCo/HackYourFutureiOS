//
//  EventListRepository.swift
//  hackYourFuture
//
//  Created by Ilan Z on 20/11/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation

enum EventListRepositoryError: Error {
    case unknown
    case noData
}

/// sourcery: AutoMockable
protocol EventListRepositoryProtocol {
    typealias EventListHandler = (Result<[Event], EventListRepositoryError>) -> Void
    func retrieveData(then handler: @escaping EventListHandler)
}

class EventListRepository {
    private let connector: ConnectorProtocol

    init(connector: ConnectorProtocol) {
        self.connector = connector
    }

    private func handleSuccess(data: Data, handler: @escaping EventListHandler) {
        do {
            let events = try JSONDecoder().decode([Event].self, from: data)
            handler(.success(events))
        } catch {
            handler(.failure(.noData))
        }
    }

    private func handleFailure(error: Error, handler: @escaping EventListHandler) {
        switch error._code {
        case 1_000:
            handler(.failure(.noData))
        default:
            handler(.failure(.unknown))
        }
    }
}

// MARK: - EventListRepositoryProtocol

extension EventListRepository: EventListRepositoryProtocol {
    func retrieveData(then handler: @escaping EventListHandler) {
        self.connector.request("http://localhost:3000/events", method: .get) { [weak self] response in
            guard let self = self else { return }

            switch response {
            case .success(let data):
                self.handleSuccess(data: data, handler: handler)
            case .failure(let error):
                self.handleFailure(error: error, handler: handler)
            }
        }
    }
}
