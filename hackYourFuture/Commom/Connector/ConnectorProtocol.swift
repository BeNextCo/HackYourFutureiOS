//
//  Connector.swift
//  hackYourFuture
//
//  Created by Ilan Z on 20/11/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation

enum ConnectorHttpMethod {
    case get
}

/// sourcery: AutoMockable
protocol ConnectorProtocol {
    func request(_ url: String,
                 method: ConnectorHttpMethod,
                 handler: @escaping (Result<Data, Error>) -> Void)
}
