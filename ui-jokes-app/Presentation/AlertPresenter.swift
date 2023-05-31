//
//  AlertPresenter.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 31.05.2023.
//

import UIKit

final class AlertPresenter {
    private weak var delegate: AlertPresentableDelegate?
    
    init(delegate: AlertPresentableDelegate?) {
        self.delegate = delegate
    }
}

extension AlertPresenter: AlertPresenterProtocol {
    func show(_ alertArgs: AlertModel) {
        let alert = UIAlertController(title: alertArgs.title,
                                      message: alertArgs.message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: alertArgs.buttonText,
                                   style: .default) { _ in
            alertArgs.completion()
        }
        
        alert.addAction(action)
        
        delegate?.present(alert: alert, animated: true)
    }
}
