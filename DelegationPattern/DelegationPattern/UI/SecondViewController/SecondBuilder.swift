//
//  SecondBuilder.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

struct SecondBuilder {
    static func build() -> UIViewController {
        let viewController = SecondViewController()
        return viewController
    }
}
