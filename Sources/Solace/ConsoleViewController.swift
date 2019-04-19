//
//  ConsoleViewController.swift
//  Solace
//
//  Created by woxtu on 2019/04/18.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import UIKit

class ConsoleViewController: UIViewController {
    private lazy var doneButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidTap(_:)))
    }()
    
    private lazy var navigationItem_: UINavigationItem = {
        let navigationItem = UINavigationItem()
        navigationItem.rightBarButtonItem = doneButton
        return navigationItem
    }()

    private lazy var navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.delegate = self
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.setItems([navigationItem_], animated: false)
        return navigationBar
    }()
    
    private lazy var consoleView = ConsoleView()
    
    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .darkGray
        view.addSubview(navigationBar)
        view.addSubview(consoleView)
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                consoleView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
                consoleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                consoleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                consoleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                navigationBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
                navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                consoleView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor),
                consoleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                consoleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                consoleView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor),
            ])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Solace.logger?.delegate = self
    }
    
    @objc func doneButtonDidTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension ConsoleViewController: UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension ConsoleViewController: LoggerDelegate {
    func dataDidUpdate(data: Data) {
        if let string = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async { [weak self] in
                self?.consoleView.log = string
            }
        }
    }
}
