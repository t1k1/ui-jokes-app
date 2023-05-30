//
//  UI+extensions.swift
//  ui-jokes-app
//
//  Created by Aleksey Kolesnikov on 30.05.2023.
//

import UIKit

extension UITextView {
    func setup() {
        let fittingSize = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let size = sizeThatFits(fittingSize)
        let topOffset = (bounds.size.height - size.height * zoomScale) / 2
        let positiveTopOffset = max(1, topOffset)
        contentOffset.y = -positiveTopOffset
        
        addBordersWithColor(color: UIColor.black, height: CGFloat(3))
    }
    
    func addBordersWithColor(color: UIColor, height: CGFloat) {
        let borderBot = UIView()
        borderBot.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        borderBot.frame = CGRect(x: self.frame.origin.x,
                                 y: self.frame.origin.y+self.frame.height-height,
                                 width: self.frame.width,
                                 height: height)
        borderBot.backgroundColor = color
        self.superview!.insertSubview(borderBot, aboveSubview: self)
        let borderTop = UIView()
        borderTop.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        borderTop.frame = CGRect(x: self.frame.origin.x,
                                 y: self.frame.origin.y,
                                 width: self.frame.width,
                                 height: height)
        borderTop.backgroundColor = color
        self.superview!.insertSubview(borderTop, aboveSubview: self)
    }
}
