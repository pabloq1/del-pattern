//
//  FirstViewController.swift
//  DelegationPattern
//
//  Created by Pablo Quagliata on 20/3/21.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()

    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var routerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var safeArea: UILayoutGuide

    let containerPadding: CGFloat = 10

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

    }

    private func setupConstraints() {
        safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: safeArea.topAnchor,
                                               constant: containerPadding),
            containerView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,
                                                   constant: containerPadding),
            containerView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -containerPadding),
            containerView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -containerPadding)
        ])
    }
}
