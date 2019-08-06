//
//  ConsoleView.swift
//  Solace
//
//  Created by woxtu on 2019/04/18.
//  Copyright (c) 2019 woxtu. All rights reserved.
//

import UIKit

class ConsoleView: UITextView {
    init() {
        super.init(frame: .zero, textContainer: nil)

        backgroundColor = .clear
        isEditable = false
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var log: String {
        get { return text }
        set { attributedText = createAttributedString(string: newValue) }
    }

    private func createAttributedString(string: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = UIFont.systemFontSize * 2

        return NSAttributedString(string: string, attributes: [
            .font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize * 0.9),
            .foregroundColor: UIColor.white,
            .paragraphStyle: paragraphStyle,
        ])
    }
}
