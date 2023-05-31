//
//  AlertPresentableDelegate.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 31.05.2023.
//

import UIKit

protocol AlertPresentableDelegate: AnyObject {
    func present(alert: UIAlertController, animated flag: Bool)
}
