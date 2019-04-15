//
//  Logger.swift
//  Solace
//
//  Created by woxtu on 2019/04/15.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import Foundation

protocol LoggerDelegate: class {
    func dataDidUpdate(data: Data)
}

class Logger {
    var delegate: LoggerDelegate?
    
    private(set) var data = Data() {
        didSet {
            delegate?.dataDidUpdate(data: data)
        }
    }
    
    private var stdoutInterceptor: FileInterceptor?
    private var stderrInterceptor: FileInterceptor?

    public init() {
        stdoutInterceptor = FileInterceptor(fileHandle: FileHandle.standardOutput) { [weak self] in
            self?.data.append($0)
        }
        stderrInterceptor = FileInterceptor(fileHandle: FileHandle.standardError) { [weak self] in
            self?.data.append($0)
        }
    }
    
    func clear() {
        data.removeAll()
    }
}
