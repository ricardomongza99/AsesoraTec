//
//  UIViewController+Extensions.swift
//  AsesoraTec
//
//  Created by Ricardo Montemayor on 03/05/22.
//

import UIKit

extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
