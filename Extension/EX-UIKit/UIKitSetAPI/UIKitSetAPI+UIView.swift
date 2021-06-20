//
//  UIKitSetAPI+UIView.swift
//  EXDemo
//
//  Created by zhiyong yin on 2021/5/22.
//

import UIKit


public extension UIView {
    
    @discardableResult
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    
    @discardableResult
    func backgroundColor(_ color: UIColor?) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    
    @discardableResult
    func isOpaque(_ isOpaque: Bool) -> Self {
        self.isOpaque = isOpaque
        return self
    }
    
    @discardableResult
    func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool) -> Self {
        self.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    
    @discardableResult
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }
    
    @discardableResult
    func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    
    @available(iOS 8.0, *)
    @discardableResult
    func mask(_ mask: UIView?) -> Self {
        self.mask = mask
        return self
    }
    
    @available(iOS 7.0, *)
    @discardableResult
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @available(iOS 7.0, *)
    @discardableResult
    func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode) -> Self {
        self.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
}

public extension UIView {
    
    @discardableResult
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    
    @discardableResult
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }

    /// The identifier of the focus group that this view belongs to. If this is nil, subviews inherit their superview's focus group.
    @available(iOS 14.0, *)
    @discardableResult
    func focusGroupIdentifier(_ focusGroupIdentifier: String?) -> Self {
        self.focusGroupIdentifier = focusGroupIdentifier
        return self
    }
    
    @available(iOS 9.0, *)
    @discardableResult
    func semanticContentAttribute(_ semanticContentAttribute: UISemanticContentAttribute) -> Self {
        self.semanticContentAttribute = semanticContentAttribute
        return self
    }
}

public extension UIView {

    @discardableResult
    func frame(_ frame: CGRect) -> Self {
        self.frame = frame
        return self
    }

    
    @discardableResult
    func bounds(_ bounds: CGRect) -> Self {
        self.bounds = bounds
        return self
    }

    @discardableResult
    func center(_ center: CGPoint) -> Self {
        self.center = center
        return self
    }

    @discardableResult
    func transform(_ transform: CGAffineTransform) -> Self {
        self.transform = transform
        return self
    }

    @available(iOS 13.0, *)
    @discardableResult
    func transform3D(_ transform3D: CATransform3D) -> Self {
        self.transform3D = transform3D
        return self
    }

    @available(iOS 4.0, *)
    @discardableResult
    func contentScaleFactor(_ contentScaleFactor: CGFloat) -> Self {
        self.contentScaleFactor = contentScaleFactor
        return self
    }

    @discardableResult
    func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool) -> Self {
        self.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }

    @discardableResult
    func isExclusiveTouch(_ isExclusiveTouch: Bool) -> Self {
        self.isExclusiveTouch = isExclusiveTouch
        return self
    }

    @discardableResult
    func autoresizesSubviews(_ autoresizesSubviews: Bool) -> Self {
        self.autoresizesSubviews = autoresizesSubviews
        return self
    }

    @discardableResult
    func autoresizingMask(_ autoresizingMask: UIView.AutoresizingMask) -> Self {
        self.autoresizingMask = autoresizingMask
        return self
    }
}

public extension UIView {

    @available(iOS 8.0, *)
    @discardableResult
    func layoutMargins(_ layoutMargins: UIEdgeInsets) -> Self {
        self.layoutMargins = layoutMargins
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func directionalLayoutMargins(_ directionalLayoutMargins: NSDirectionalEdgeInsets) -> Self {
        self.directionalLayoutMargins = directionalLayoutMargins
        return self
    }

    @available(iOS 8.0, *)
    @discardableResult
    func preservesSuperviewLayoutMargins(_ preservesSuperviewLayoutMargins: Bool) -> Self {
        self.preservesSuperviewLayoutMargins = preservesSuperviewLayoutMargins
        return self
    }

    @available(iOS 11.0, *)
    @discardableResult
    func insetsLayoutMarginsFromSafeArea(_ insetsLayoutMarginsFromSafeArea: Bool) -> Self {
        self.insetsLayoutMarginsFromSafeArea = insetsLayoutMarginsFromSafeArea
        return self
    }
}

public extension UIView {
    
    @available(iOS 3.2, *)
    @discardableResult
    func gestureRecognizers(_ gestureRecognizers: [UIGestureRecognizer]?) -> Self {
        self.gestureRecognizers = gestureRecognizers
        return self
    }
}

public extension UIView {

    @available(iOS 7.0, *)
    @discardableResult
    func motionEffects(_ motionEffects: [UIMotionEffect]) -> Self {
        self.motionEffects = motionEffects
        return self
    }
}

public extension UIView {

    @available(iOS 6.0, *)
    @discardableResult
    func translatesAutoresizingMaskIntoConstraints(_ translatesAutoresizingMaskIntoConstraints: Bool) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        return self
    }
}

public extension UIView {

    @available(iOS 6.0, *)
    @discardableResult
    func restorationIdentifier(_ restorationIdentifier: String?) -> Self {
        self.restorationIdentifier = restorationIdentifier
        return self
    }
}

public extension UIView {
    
    @available(iOS 13.0, *)
    @discardableResult
    func overrideUserInterfaceStyle(_ overrideUserInterfaceStyle: UIUserInterfaceStyle) -> Self {
        self.overrideUserInterfaceStyle = overrideUserInterfaceStyle
        return self
    }
}
