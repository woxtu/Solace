//
//  MainWindow.swift
//  Solace
//
//  Created by woxtu on 2019/04/17.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import UIKit

class MainWindow: UIWindow {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tintColor = .darkGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == self ? nil : view
    }
}
