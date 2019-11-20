//
//  AlamofireAdapter.swift
//  hackYourFuture
//
//  Created by Ilan Z on 20/11/2019.
//  Copyright © 2019 BeNext. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireAdapter {
}

// MARK: - ConnectorProtocol

extension AlamofireAdapter: ConnectorProtocol {
    func request(_ url: String,
                 method: ConnectorHttpMethod,
                 handler: @escaping (Swift.Result<Data, Error>) -> Void) {
        Alamofire.request(url).response { response in
            if let error = response.error {
                handler(.failure(error))

                return
            }

            guard let data = response.data else {
                let error = NSError(domain: "AdapterError.noData", code: 1_000, userInfo: nil)
                handler(.failure(error))

                return
            }

            handler(.success(data))
        }
    }
}
