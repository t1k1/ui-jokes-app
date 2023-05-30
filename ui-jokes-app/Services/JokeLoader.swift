//
//  JokeLoader.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 30.05.2023.
//

import Foundation

protocol JokeLoading {
    func loadJoke(handler: @escaping (Result<RandomJoke, Error>) -> Void)
}

struct JokeLoader: JokeLoading {
    private let netWorkClient = NetworkClient()
    
    private var randomJokeURL: URL{
        guard let url = URL(string: "https://official-joke-api.appspot.com/jokes/random") else {
            preconditionFailure("Unable to construct mostPopularMoviesUrl")
        }
        return url
    }
    
    func loadJoke(handler: @escaping (Result<RandomJoke, Error>) -> Void) {
        
        netWorkClient.fetch(url: randomJokeURL) { result in
            switch result {
                case .success(let data):
                    do {
                        let randomJoke = try JSONDecoder().decode(RandomJoke.self, from: data)
                        handler(.success(randomJoke))
                    } catch {
                        handler(.failure(error))
                    }
                case .failure(let error):
                    handler(.failure(error))
            }
            
        }
    }
    
    
}
