//
//  RestClient.swift
//  Atlastefem
//
//  Created by Jmorgaz on 25/12/20.
//

import Foundation
import Combine
import CryptoKit

protocol RestClientProtocol {
    var baseUrl: String { get }
    func perform<T: Decodable>(_ router: AtlastefemAPI, _ decoder: JSONDecoder) -> AnyPublisher<T, Error>
}

struct RestClient: RestClientProtocol {

    internal var baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func perform<T: Decodable>(_ router: AtlastefemAPI, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {

        let request = asURLRequest(router: router)

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> T in
                let value = try decoder.decode(T.self, from: result.data)
                return value }
            .mapError { error in
                print(error)
                return error }
            .eraseToAnyPublisher()
    }

    private func asURLRequest(router: AtlastefemAPI) -> URLRequest {
        let path = "\(baseUrl)"
        var components = URLComponents(string: path)
        var queryItems = [URLQueryItem]()
        queryItems.append(contentsOf: router.queryItems)
        queryItems.append(URLQueryItem(name: "api_key", value: Constants.apiKey))
        queryItems.sort { $0.name < $1.name }
        queryItems.append(URLQueryItem(name: "api_sig", value: generateSignatureFromQueryItems(queryItems)))
        queryItems.append(URLQueryItem(name: "format", value: "json"))
        components?.queryItems = queryItems

        var urlRequest = URLRequest(url: (components?.url)!)
        urlRequest.httpMethod = router.httpMethod

        return urlRequest
    }
}

private func generateSignatureFromQueryItems(_ items: [URLQueryItem]) -> String {
    let signatureArray: [String] = items.compactMap { $0.name + ($0.value ?? "") }
    var signatureString = signatureArray.joined()
    signatureString.append(Constants.secret)
    let signature = md5Hash(signatureString)
    
    return signature
}

private func md5Hash(_ source: String) -> String {
    return Insecure.MD5.hash(data: source.data(using: .utf8)!).map { String(format: "%02hhx", $0) }.joined()
}
