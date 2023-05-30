//
//  JokeFactoryDelegate.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 30.05.2023.
//

import Foundation

protocol JokeFactoryDelegate: AnyObject {
    func didReceiveNextJoke(joke: JokeModel?)
    func didLoadDataFromServer()
    func didFailToLoadData(error: Error)
}
