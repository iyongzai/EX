//
//  Extension-UIView.swift
//  iVCoin
//
//  Created by ayong on 2017/11/28.
//  Copyright © 2017年 阿勇. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //MARK: - 给view添加圆角
    /// 给view添加圆角
    //@IBInspectable
    public var ayCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        // also  set(newValue)
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    //MARK: - 给view指定边框宽度
    /// 给view指定边框宽度
    //@IBInspectable
    public var ayBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    //MARK: - 给view指定边框颜色
    /// 给view指定边框颜色
    //@IBInspectable
    public var ayBorderColor: UIColor? {
        get {
            return UIColor.init(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView {
    // MARK: - view截图
    /// view截图
    ///
    /// - Parameter scale: scale
    /// - Returns: UIImage?
    public func screenShot(scale: CGFloat = 0) -> UIImage? {
        guard frame.size.height > 0 && frame.size.width > 0 else {
            return nil
        }
        
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}

extension UIView {
    // MARK: - 设置阴影
    /// 设置阴影
    ///
    /// - Parameters:
    ///   - color: 阴影颜色
    ///   - opacity: 不透明度 0~1
    ///   - offset: 偏移量CGSize
    public func setShadow(_ color: UIColor = UIColor.black, opacity: Float = 0.25, offset: CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
    }
}
