//
//  SecondViewController.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Outlets
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.Screen2.textFieldPlaceholder
        return textField
    }()

    private lazy var routerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Screen2.routerButtonTitle, for: .normal)
        return button
    }()

    // MARK: - Properties
    var delegate: SendingMessageDelegate?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
}

    // MARK: - Actions
extension SecondViewController {
//    @objc private func
}

    // MARK: - UI
extension SecondViewController {

    private func setupUI() {
        view.addSubview(textField)
        view.addSubview(routerButton)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 150),
            textField.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: 100)
        ])
    }
}
