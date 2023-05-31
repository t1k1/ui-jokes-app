//
//  AlertModel.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 31.05.2023.
//

import Foundation

struct AlertModel {
    let title: String
    let message: String
    let buttonText: String
    let completion: () -> Void
}
