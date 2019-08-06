//
//  Solace.swift
//  Solace
//
//  Created by woxtu on 2019/04/10.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import UIKit

public class Solace {
    static var logger: Logger?

    private static var window: MainWindow?

    public static func configure() {
        logger = Logger()

        window = MainWindow(frame: UIScreen.main.bounds)
        window?.windowLevel = UIWindow.Level(rawValue: 1)
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
    }

    private init() {}
}
