//
//  FileInterceptor.swift
//  Solace
//
//  Created by woxtu on 2019/04/10.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import Foundation

class FileInterceptor {
    private let pipe = Pipe()

    init(fileHandle: FileHandle, handler: @escaping (Data) -> Void) {
        let outputHandle = FileHandle(fileDescriptor: dup(fileHandle.fileDescriptor))
        pipe.fileHandleForReading.readabilityHandler = {
            let data = $0.availableData
            handler(data)
            outputHandle.write(data)
        }

        dup2(pipe.fileHandleForWriting.fileDescriptor, fileHandle.fileDescriptor)
    }
}
