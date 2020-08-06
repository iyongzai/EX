//
//  Extension-UILabel.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/8/6.
//  Copyright © 2020 ayong. All rights reserved.
//

import UIKit

extension UILabel {
    func setUnderline() {
        guard text != nil else { return }
        let title = NSMutableAttributedString(string: text!)
        title.addAttribute(NSAttributedString.Key.underlineStyle,
                           value: NSNumber.init(value: NSUnderlineStyle.single.rawValue),
                           range: NSRange.init(location: 0, length: title.length))
        self.attributedText = title
    }
}
