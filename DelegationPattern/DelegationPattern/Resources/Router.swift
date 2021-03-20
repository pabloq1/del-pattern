//
//  Router.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

protocol Routering {
    func route(whereTo: Screens, context: UIViewController)
}

enum Screens {
    case First
    case Second
}


struct MainRouter: Routering {
    func route(whereTo: Screens, context: UIViewController) {
        switch whereTo {
        case .First:
            context.navigationController?.popViewController(animated: true)
        default:
            context.navigationController?.present(SecondBuilder.build(),
                                                  animated: true,
                                                  completion: nil)
        }
    }
}
