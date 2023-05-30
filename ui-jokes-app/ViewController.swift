//
//  ViewController.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 03.05.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var setupTextView: UITextView!
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var jokeIdLabel: UILabel!
    @IBOutlet private weak var showPunclineButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Actions
    @IBAction private func refreshButtonClicked() {
        showNextJoke()
    }
    
    @IBAction private func showPunchlineButtonClicked() {
    }
    
    // MARK: - Variables
    private var currentJoke: JokeModel?
    private var jokeFactory: JokeFactoryProtocol?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeFactory = JokeFactory(delegate: self, jokeLoader: JokeLoader())
        
        setupTextView.setup()
        
        showNextJoke()
    }
}

extension ViewController: JokeFactoryDelegate {
    // MARK: - JokeFactoryDelegate
    func didReceiveNextJoke(joke: JokeModel?){
        guard let joke = joke else { return }
        
        currentJoke = joke
        guard let currentJoke = currentJoke else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.show(joke: currentJoke)
        }
    }
    
    func didLoadDataFromServer() {
        loadingIndicatorHidden(true)
        jokeFactory?.requestNewJoke()
    }
    
    func didFailToLoadData(error: Error) {
        showNetworkError(message: error.localizedDescription)
    }
    
    // MARK: - Private functions
    private func show(joke: JokeModel) {
        jokeIdLabel.text = String(joke.jokeId)
        typeLabel.text = joke.type
        setupTextView.text = joke.setup
    }
    
    private func showNextJoke(){
        jokeIdLabel.text = ""
        typeLabel.text = ""
        setupTextView.text = ""
        
        loadingIndicatorHidden(false)
        jokeFactory?.loadJoke()
    }
    
    private func loadingIndicatorHidden(_ state: Bool) {
        activityIndicator.isHidden = state
        if state {
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.startAnimating()
        }
    }
    
    private func showNetworkError(message: String) {
        print("ERROR! \(message)")
    }
}
