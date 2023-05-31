//
//  AlertPresenterProtocol.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 31.05.2023.
//

import Foundation

protocol AlertPresenterProtocol: AnyObject {
    func show(_ alertArgs: AlertModel)
}
