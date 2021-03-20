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
            let viewController = SecondBuilder.build() as? SecondViewController
            guard let controller = viewController else { return }
            controller.messageDelegate = delegate
            context.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
