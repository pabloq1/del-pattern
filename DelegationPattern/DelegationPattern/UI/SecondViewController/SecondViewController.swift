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
        textField.delegate = textFieldDelegate
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.placeholder = Constants.Screen2.textFieldPlaceholder
        return textField
    }()

    private lazy var routerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.lightTeal
        button.setTitle(Constants.Screen2.routerButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        button.dropShadow()
        return button
    }()

    // MARK: - Properties
    var messageDelegate: SendingMessageDelegate?
    var textFieldDelegate: TextFieldDelegate?
    var router: MainRouter?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        router = MainRouter()
        textFieldDelegate = TextFieldDelegate(controller: self)
        setupUI()
        setupConstraints()
    }
}

    // MARK: - Actions
extension SecondViewController {

    /**
     Using a delegate, we send the string we want written on the first viewController.
     This delegate conforms to the protocol defined on the previous file.
     We then route back to the first viewController with an updated label.
     */
    @objc private func sendMessage() {
        guard let text = textField.text else { return }
        messageDelegate?.sendMessage(text)
        router?.route(whereTo: .first, context: self, delegate: nil)
    }
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
            textField.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                           constant: 150),
            textField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                               constant: 20),
            textField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])

        NSLayoutConstraint.activate([
            routerButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -100),
            routerButton.widthAnchor.constraint(equalToConstant: 200),
            routerButton.heightAnchor.constraint(equalToConstant: 60),
            routerButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)
        ])
    }
}
