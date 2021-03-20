//
//  FirstViewController.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

protocol SendingMessageDelegate {
    func sendMessage(_ string: String)
}

class FirstViewController: UIViewController, SendingMessageDelegate {

    // MARK: - Outlets
    private lazy var mainContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.darkTeal
        return view
    }()

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
        view.backgroundColor = .white
        return view
    }()

    private lazy var stackView: UIStackView = {
        let verticalStack = UIStackView()
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.distribution  = .fill
        return verticalStack
    }()

    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Screen1.initialTitle
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    private lazy var routerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.Screen1.routerButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.lightTeal
        button.dropShadow()
        button.addTarget(self, action: #selector(buttonRoute), for: .touchUpInside)
        return button
    }()

    // MARK: - Properties
    let bottomContainerViewHeight: CGFloat = 80
    let stackPadding: CGFloat = 5
    let containerYPadding: CGFloat = 100
    let mainContainerXPadding: CGFloat = 20
    let mainContainerYPadding: CGFloat = 200
    var router: MainRouter?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.router = MainRouter()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
    }
}

    // MARK: - Actions
extension FirstViewController {

    @objc private func buttonRoute() {
        router?.route(whereTo: .second, context: self, delegate: self)
    }

    func sendMessage(_ string: String) {
        self.textLabel.text = string
    }
}

    // MARK: - UI
extension FirstViewController {

    private func setupViews() {
        /**
         parent subview contains a stack,
         we use addArrangedSubview since it automatically adds the provided view as a subview of the stack view
         */
        view.addSubview(mainContainerView)
        mainContainerView.addSubview(stackView)
        stackView.addArrangedSubview(topContainerView)
        topContainerView.addSubview(textLabel)
        stackView.addArrangedSubview(bottomContainerView)
        bottomContainerView.addSubview(routerButton)
    }

    private func setupConstraints() {
        /**
         we use safeArea layouts for positioning the stackView
         */
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            mainContainerView.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                           constant: mainContainerYPadding),
            mainContainerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                               constant: mainContainerXPadding),
            mainContainerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,
                                                constant: -mainContainerXPadding),
            mainContainerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,
                                              constant: -mainContainerYPadding)
        ])

        /**
         setting stack constraints
         */
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: mainContainerView.topAnchor,
                                           constant: stackPadding),
            stackView.leadingAnchor.constraint(equalTo: mainContainerView.leadingAnchor,
                                               constant: stackPadding),
            stackView.trailingAnchor.constraint(equalTo: mainContainerView.trailingAnchor,
                                                constant: -stackPadding),
            stackView.bottomAnchor.constraint(equalTo: mainContainerView.bottomAnchor,
                                              constant: -stackPadding)
        ])

        /**
         setting bottomCointainerView constraints,
         we want it to have a fixed height
         */
        NSLayoutConstraint.activate([
            bottomContainerView.heightAnchor.constraint(equalToConstant: bottomContainerViewHeight)
        ])

        /**
         second subView be centered in its container
         */
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: topContainerView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor,
                                               constant: -containerYPadding),
            routerButton.heightAnchor.constraint(equalToConstant: 40),
            routerButton.widthAnchor.constraint(equalToConstant: 200),
            routerButton.centerXAnchor.constraint(equalTo: bottomContainerView.centerXAnchor),
            routerButton.centerYAnchor.constraint(equalTo: bottomContainerView.centerYAnchor)
        ])
    }
}

