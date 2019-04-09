//
//  Solace.swift
//  Solace
//
//  Created by woxtu on 2019/04/10.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import Foundation

public class Solace {
    private static var data = Data()
    private static var stdoutInterceptor: FileInterceptor? = nil
    private static var stderrInterceptor: FileInterceptor? = nil
        
    public static var log: String {
        return String(data: data, encoding: .utf8) ?? ""
    }
    
    public static func configure() {
        stdoutInterceptor = FileInterceptor(fileHandle: FileHandle.standardOutput) {
            data.append($0)
        }
        stderrInterceptor = FileInterceptor(fileHandle: FileHandle.standardError) {
            data.append($0)
        }
    }
    
    private init() {
        
    }
}
