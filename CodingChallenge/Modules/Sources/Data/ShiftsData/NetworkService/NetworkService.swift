//
//  File.swift
//  
//
//  Created by Adrian Chmura on 23/12/2022.
//

import Foundation

#warning("TODO: Move service to separate module so it can be reused by other modules clients/restServices")

protocol NetworkService: AnyObject {
    func data<ResponseObject: Decodable>(for request: URLRequest) async throws -> ResponseObject
}

final class DefaultNetworkService: NetworkService {
    private let session: URLSession
    private let decoder: JSONDecoder

    init(session: URLSession = .init(configuration: .default), decoder: JSONDecoder) {
        self.session = session
        self.decoder = decoder
    }

    func data<ResponseObject: Decodable>(for request: URLRequest) async throws -> ResponseObject {
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(ResponseObject.self, from: data)
    }
}
