//
//  UIKitSetAPI+UILabel.swift
//  EXDemo
//
//  Created by zhiyong yin on 2021/5/23.
//

import UIKit


public extension UILabel {
    
    // default is nil
    @discardableResult
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    
    // default is nil (system font 17 plain)
    @discardableResult
    func font(_ font: UIFont!) -> Self {
        self.font = font
        return self
    }
    
    // default is labelColor
    @discardableResult
    func textColor(_ textColor: UIColor!) -> Self {
        self.textColor = textColor
        return self
    }
    
    // default is nil (no shadow)
    @discardableResult
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }
    
    // default is CGSizeMake(0, -1) -- a top shadow
    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }
    
    // default is NSTextAlignmentNatural (before iOS 9, the default was NSTextAlignmentLeft)
    @discardableResult
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    
    // default is NSLineBreakByTruncatingTail. used for single and multiple lines of text
    @discardableResult
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }
    
    // the underlying attributed string drawn by the label, if set, the label ignores the properties above.
    // default is nil
    @available(iOS 6.0, *)
    @discardableResult
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }
    
    // the 'highlight' property is used by subclasses for such things as pressed states. it's useful to make it part of the base class as a user property
    // default is nil
    @discardableResult
    func highlightedTextColor(_ highlightedTextColor: UIColor?) -> Self {
        self.highlightedTextColor = highlightedTextColor
        return self
    }

    // default is NO
    @discardableResult
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    
    /*
    // default is NO
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }*/
    
    // default is YES. changes how the label is drawn
    @discardableResult
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    
    // this determines the number of lines to draw and what to do when sizeToFit is called. default value is 1 (single line). A value of 0 means no limit
    // if the height of the text reaches the # of lines or the height of the view is less than the # of lines allowed, the text will be
    // truncated using the line break mode.
    @discardableResult
    func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }

    
    // these next 3 properties allow the label to be autosized to fit a certain width by scaling the font size(s) by a scaling factor >= the minimum scaling factor
    // and to specify how the text baseline moves when it needs to shrink the font.
    // default is NO
    @discardableResult
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }

    // default is UIBaselineAdjustmentAlignBaselines
    @discardableResult
    func baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self {
        self.baselineAdjustment = baselineAdjustment
        return self
    }
    
    @available(iOS 6.0, *)
    // default is 0.0
    @discardableResult
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    
    // Tightens inter-character spacing in attempt to fit lines wider than the available space if the line break mode is one of the truncation modes before starting to truncate.
    // The maximum amount of tightening performed is determined by the system based on contexts such as font, line width, etc.
    @available(iOS 9.0, *)
    // default is NO
    @discardableResult
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self {
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    
    // Specifies the line break strategies that may be used for laying out the text in this label.
    // If this property is not set, the default value is NSLineBreakStrategyStandard.
    // If the label contains an attributed text with paragraph style(s) that specify a set of line break strategies, the set of strategies in the paragraph style(s) will be used instead of the set of strategies defined by this property.
    @discardableResult
    func lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self {
        self.lineBreakStrategy = lineBreakStrategy
        return self
    }
    
    // Support for constraint-based layout (auto layout)
    // If nonzero, this is used when determining -intrinsicContentSize for multiline labels
    @available(iOS 6.0, *)
    @discardableResult
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self {
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
}
