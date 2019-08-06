//
//  MainViewController.swift
//  Solace
//
//  Created by woxtu on 2019/04/17.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    private class View: UIView {
        override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            let view = super.hitTest(point, with: event)
            return view == self ? nil : view
        }
    }

    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitle("⏏", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.sizeToFit()
        return button
    }()

    override func loadView() {
        super.loadView()

        view = View()

        view.addSubview(button)
        button.center = CGPoint(x: UIScreen.main.bounds.width - 48, y: UIScreen.main.bounds.height - 48)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(buttonDidDrag(_:)))
        button.addGestureRecognizer(gestureRecognizer)

        button.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
    }

    @objc func buttonDidDrag(_ sender: UIPanGestureRecognizer) {
        sender.view?.center = sender.location(in: sender.view?.superview)
    }

    @objc func buttonDidTap(_ sender: UIButton) {
        let viewController = ConsoleViewController()
        present(viewController, animated: true)
    }
}
