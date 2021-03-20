//
//  TextFieldDelegate.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {

    // MARK: - Properties
    var controller: SecondViewController?

    // MARK: - Life cycle
    init(controller: SecondViewController) {
        self.controller = controller
    }

    // MARK: - Functions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
