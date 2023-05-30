//
//  JokeFactory.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 30.05.2023.
//

import Foundation

class JokeFactory: JokeFactoryProtocol {
    private let jokeLoader: JokeLoading
    weak var delegate: JokeFactoryDelegate?
    
    private var randomJoke: RandomJoke = RandomJoke(type: "",
                                                    setup: "",
                                                    punchline: "",
                                                    id: 0)
    
    func loadJoke() {
        jokeLoader.loadJoke { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                    case .success(let randomJoke):
                        self.randomJoke = randomJoke
                        self.delegate?.didLoadDataFromServer()
                    case .failure(let error):
                        self.delegate?.didFailToLoadData(error: error)
                }
            }
        }
    }
    
    func requestNewJoke() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
                 
            let joke = JokeModel(jokeId: self.randomJoke.id,
                                 type: self.randomJoke.type,
                                 setup: self.randomJoke.setup,
                                 punchline: self.randomJoke.punchline)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                self.delegate?.didReceiveNextJoke(joke: joke)
            }
        }
    }
    
    init(delegate: JokeFactoryDelegate, jokeLoader: JokeLoading) {
        self.delegate = delegate
        self.jokeLoader = jokeLoader
    }
}
