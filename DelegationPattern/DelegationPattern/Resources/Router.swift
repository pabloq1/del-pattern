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
    case first
    case second
}


struct MainRouter: Routering {
    func route(whereTo: Screens, context: UIViewController) {
        switch whereTo {
        case .first:
            context.navigationController?.popViewController(animated: true)
        default:
            context.navigationController?.pushViewController(SecondBuilder.build(), animated: true)
        }
    }
}
