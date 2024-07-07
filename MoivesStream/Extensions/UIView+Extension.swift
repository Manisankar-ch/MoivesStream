//
//  UIView+Extension.swift
//  MoivesStream
//
//  Created by Mani Sankar on 07/07/24.
//

import UIKit
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
