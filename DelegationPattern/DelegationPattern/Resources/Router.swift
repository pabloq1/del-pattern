//
//  Router.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

enum Screens {
    case first
    case second
}


struct MainRouter {
    func route(whereTo: Screens, context: UIViewController, delegate: SendingMessageDelegate?) {
        switch whereTo {
        case .first:
            context.navigationController?.popViewController(animated: true)
        default:
            let controller = SecondBuilder.build() as? SecondViewController
            controller?.messageDelegate = delegate
            context.navigationController?.pushViewController(SecondBuilder.build(), animated: true)
        }
    }
}
