//
//  FirstViewController.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Outlets

    private lazy var topContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        return view
    }()

    private lazy var bottomContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
        //view.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
        view.backgroundColor = .red
        return view
    }()

    private lazy var stackView: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.distribution  = UIStackView.Distribution.fill
        return verticalStack
    }()

    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.text = "HOLA"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var routerButton: UIButton = {
        let button = UIButton()
        button.setTitle("HOLABUTTON", for: .normal)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Properties
    let containerYPadding: CGFloat = 30
    let stackXPadding: CGFloat = 50
    let stackYPadding: CGFloat = 300

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
}

extension FirstViewController {

    private func setupViews() {
        // containerView within parent view
        view.addSubview(stackView)
        stackView.addArrangedSubview(topContainerView)
        topContainerView.addSubview(textLabel)
        stackView.addArrangedSubview(bottomContainerView)
        bottomContainerView.addSubview(routerButton)
    }

    private func setupConstraints() {
        // we use safeArea layouts for positioning the containerView
        let safeArea = view.safeAreaLayoutGuide

        // setting stack constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                           constant: stackYPadding),
            stackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                               constant: stackXPadding),
            stackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                constant: -stackXPadding),
            stackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                              constant: -stackYPadding)
        ])

        NSLayoutConstraint.activate([
            bottomContainerView.heightAnchor.constraint(equalToConstant: 80)
        ])

        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor,
                                               constant: -containerYPadding),
            routerButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            routerButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor)
        ])
    }
}
