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
    @IBInspectable
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
    @IBInspectable
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
    @IBInspectable
    public var ayBorderColor: UIColor? {
        get {
            return UIColor.init(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    public func ayPartCorner(_ corner: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = CACornerMask.init(rawValue: corner.rawValue)
        } else {
            let path = UIBezierPath.init(roundedRect: self.bounds,
                                         byRoundingCorners: corner,
                                         cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}

// MARK: - 扩展toast功能：上面图片，下面文字
extension UIView {
    // MARK: - 扩展toast功能：上面图片，下面文字
    public func makeToast(_ topImg: UIImage, bottomMSG: String) {
        let toast = UIView.init(frame: CGRect.init(x: (self.frame.width-125)/2, y: (self.frame.height-100)/2-50, width: 125, height: 100))
        toast.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        toast.ayCornerRadius = 10
        self.addSubview(toast)
        /*
        toast.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize.init(width: 125, height: 100))
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(-50)
        }
        */
        
        let label = UILabel.init(frame: CGRect.init(x: 0, y: toast.frame.height-20-15, width: toast.frame.width, height: 20))
        label.text = bottomMSG
        label.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
        label.textColor = UIColor.white
        label.textAlignment = .center
        toast.addSubview(label)
        /*
        label.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(-15)
            make.height.equalTo(20)
        }
        */
        let imgView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: toast.frame.width, height: toast.frame.height-20-15))
        imgView.image = topImg
        imgView.contentMode = .center
        toast.addSubview(imgView)
        /*
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(label.snp.top)
        }
        */
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            toast.removeFromSuperview()
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
    public func setShadow(color: UIColor = UIColor.black.withAlphaComponent(0.4), offset: CGSize = CGSize.zero, opacity: Float = 0.4, radius: CGFloat = 3) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.clipsToBounds = false
    }
}

public extension UIView {
    ///响应链 控制器
    var viewController: UIViewController? {
        var next = superview
        while (next != nil) {
            let nextResponder = next?.next
            if (nextResponder is UIViewController) {
                return nextResponder as? UIViewController
            }
            next = next?.superview
        }
        return nil
    }
}


// MARK: - rect, size, width, height, x, y, center, top, left, bottom, right
public extension UIView {
    var top: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    var bottom: CGFloat {
        get { return self.frame.size.height + self.frame.origin.y }
        set { self.frame.origin.y = newValue - frame.size.height }
    }
    var left: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    var right: CGFloat {
        get { return self.frame.size.width + self.frame.origin.x }
        set { self.frame.origin.x = newValue - frame.size.width }
    }
    var x: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    var y: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    var origin: CGPoint {
        get { return self.frame.origin }
        set { self.frame.origin = newValue }
    }
    var centerX: CGFloat {
        get { return self.center.x }
        set { self.center.x = newValue }
    }
    var centerY: CGFloat {
        get { return self.center.y }
        set { self.center.y = newValue }
    }
    var width: CGFloat {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    var size: CGSize {
        get { return self.frame.size }
        set { self.frame.size = newValue }
    }
}
