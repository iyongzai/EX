//
//  Extension-UIButton.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/4/12.
//  Copyright © 2020 ayong. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    //MARK: - Button在IB上添加设置标题自适应宽度
    /// Button在IB上添加设置标题自适应宽度
    @IBInspectable
    public var ayAdjustsFontSizeToFitWidth: Bool {
        get {
            return titleLabel?.adjustsFontSizeToFitWidth ?? false
        }
        // also  set(newValue)
        set {
            titleLabel?.adjustsFontSizeToFitWidth = newValue
        }
    }
}


public extension UIButton {
//    func aySetBorderColor(_ color: UIColor?, for state: UIControl.State) {
//
//    }
    func noDoubleClick() {
        guard self.isUserInteractionEnabled else { return }
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.isUserInteractionEnabled = true
        })
    }
    
    func setUnderline() {
        guard currentAttributedTitle != nil || currentTitle != nil else { return }
        var title = NSMutableAttributedString()
        if currentAttributedTitle != nil {
            title.append(currentAttributedTitle!)
        }else{
            title = NSMutableAttributedString(string: currentTitle!, attributes: [NSAttributedString.Key.foregroundColor : currentTitleColor])
        }
        title.addAttribute(NSAttributedString.Key.underlineStyle,
                           value: NSNumber.init(value: NSUnderlineStyle.single.rawValue),
                           range: NSRange.init(location: 0, length: title.length))
        self.setAttributedTitle(title, for: .normal)
    }
}
