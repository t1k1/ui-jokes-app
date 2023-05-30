//
//  RandomJoke.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 30.05.2023.
//

import Foundation

struct RandomJoke: Codable {
    let type: String
    let setup: String
    let punchline: String
    let id: Int
}

//{
//    "type":"general",
//    "setup":"Did you know that protons have mass?",
//    "punchline":"I didn't even know they were catholic.",
//    "id":104
//}
