//
//  HomeViewModel.swift
//  Atlastefem
//
//  Created by Jmorgaz on 25/12/20.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    private let restClient = RestClient(baseUrl: Constants.baseURL)
    private var cancellable = Set<AnyCancellable>()
    
    private func getSession() -> AnyPublisher<SessionResponse, Error> {
        restClient.perform(AtlastefemAPI.session(username: "", password: ""))
    }
    
    func updateSession() {
        getSession()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    print("FAILURE")
                }
            }, receiveValue: { session in
                print(session)
            })
            .store(in: &cancellable)
    }
}
