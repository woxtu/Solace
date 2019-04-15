//
//  Solace.swift
//  Solace
//
//  Created by woxtu on 2019/04/10.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import Foundation

public class Solace {
    static var logger: Logger?
    
    public static func configure() {
        logger = Logger()
    }
    
    private init() {
        
    }
}
