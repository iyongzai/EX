//
//  Extension-UILabel.swift
//  EXDemo
//
//  Created by zhiyong yin on 2020/8/6.
//  Copyright © 2020 ayong. All rights reserved.
//

import UIKit


public extension UILabel {
    func setText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    func setTextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    func setFont(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    func setNumberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    func setTextColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
    func setShadowColor(_ shadowColor: UIColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }
    func setShadowOffset(_ shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }
    func setLineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }
    func setAttributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }
    func setHighlightedTextColor(_ highlightedTextColor: UIColor?) -> Self {
        self.highlightedTextColor = highlightedTextColor
        return self
    }
    func setIsHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    func setIsEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    func setAdjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    func setBaselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self {
        self.baselineAdjustment = baselineAdjustment
        return self
    }
    func setMinimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    func setAllowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self {
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    func setPreferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self {
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
}



public extension UILabel {
    func setUnderline() {
        guard text != nil else { return }
        let title = NSMutableAttributedString(string: text!, attributes: [NSAttributedString.Key.foregroundColor : textColor!])
        title.addAttribute(NSAttributedString.Key.underlineStyle,
                           value: NSNumber.init(value: NSUnderlineStyle.single.rawValue),
                           range: NSRange.init(location: 0, length: title.length))
        self.attributedText = title
    }
}
