//
//  Extension-UITextField.swift
//  iVCoin
//
//  Created by ayong on 2017/11/29.
//  Copyright © 2017年 阿勇. All rights reserved.
//

import UIKit

public extension UITextField {
    func setText(_ text: String?) -> Self {
        self.text = text
        return self
    }
    func setAttributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
        return self
    }
    func setTextColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    func setFont(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    func setTextAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    func setBorderStyle(_ borderStyle: UITextField.BorderStyle) -> Self {
        self.borderStyle = borderStyle
        return self
    }
    func setDefaultTextAttributes(_ defaultTextAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.defaultTextAttributes = defaultTextAttributes
        return self
    }
    func setPlaceholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    func setAttributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }
    func setAdjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    func setClearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self {
        self.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    func setMinimumFontSize(_ minimumFontSize: CGFloat) -> Self {
        self.minimumFontSize = minimumFontSize
        return self
    }
    func setDelegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    func setBackground(_ background: UIImage?) -> Self {
        self.background = background
        return self
    }
    func setDisabledBackground(_ disabledBackground: UIImage?) -> Self {
        self.disabledBackground = disabledBackground
        return self
    }
    func setAllowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    func setTypingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]?) -> Self {
        self.typingAttributes = typingAttributes
        return self
    }
    func setClearButtonMode(_ clearButtonMode: UITextField.ViewMode) -> Self {
        self.clearButtonMode = clearButtonMode
        return self
    }
    func setLeftView(_ leftView: UIView?) -> Self {
        self.leftView = leftView
        return self
    }
    func setLeftViewMode(_ leftViewMode: UITextField.ViewMode) -> Self {
        self.leftViewMode = leftViewMode
        return self
    }
    func setRightView(_ rightView: UIView?) -> Self {
        self.rightView = rightView
        return self
    }
    func setRightViewMode(_ rightViewMode: UITextField.ViewMode) -> Self {
        self.rightViewMode = rightViewMode
        return self
    }
    func setInputView(_ inputView: UIView?) -> Self {
        self.inputView = inputView
        return self
    }
    func setInputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.inputAccessoryView = inputAccessoryView
        return self
    }
    func setClearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.clearsOnInsertion = clearsOnInsertion
        return self
    }
}




// MARK: - leftView & rightView
extension UITextField {
    //MARK: - 设置UITextField的leftView
    /// 设置 leftView
    ///
    /// - Parameters:
    ///   - imageName: image name
    ///   - width: width
    ///   - height: height
    @available(*, deprecated, renamed: "setLeftImg(_:width:height:)")
    public func aySetLeftImageView(_ imageName: String, width: CGFloat = 30, height: CGFloat = 44) {
        self.setLeftImg(imageName, width: width, height: height)
    }
    
    //MARK: - 设置UITextField的rightView
    /// 设置UITextField的rightView
    ///
    /// - Parameters:
    ///   - imageName: image name
    ///   - width: width
    ///   - height: height
    @available(*, deprecated, renamed: "setRightImg(_:width:height:)")
    public func aySetRightImageView(_ imageName: String, width: CGFloat = 30, height: CGFloat = 44) {
        self.setRightImg(imageName, width: width, height: height)
    }
    
    //MARK: - 设置UITextField的rightView
    /// 设置UITextField的rightView
    ///
    /// - Parameters:
    ///   - normalImageName: normal image name
    ///   - width: width
    ///   - height: height
    /// - Returns: 返回rightView
    @available(*, deprecated, renamed: "setRightButton(_:width:height:)")
    public func aySetRightButton(_ normalImageName: String, width: CGFloat = 30, height: CGFloat = 44) -> UIButton {
        return self.setRightButton(normalImageName, width: width, height: height)
    }
    
    /// --------------------------leftView & rightView 调整新的api名称--------------------------
    
    //MARK: - 设置UITextField的leftView
    /// 设置 leftView
    ///
    /// - Parameters:
    ///   - imageName: image name
    ///   - width: width
    ///   - height: height
    public func setLeftImg(_ imageName: String, width: CGFloat = 30, height: CGFloat = 44) {
        let uLeftView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        uLeftView.image = UIImage.init(named: imageName)
        uLeftView.contentMode = .center
        self.leftView = uLeftView
        self.leftViewMode = .always
    }
    
    //MARK: - 设置UITextField的rightView
    /// 设置UITextField的rightView
    ///
    /// - Parameters:
    ///   - imageName: image name
    ///   - width: width
    ///   - height: height
    public func setRightImg(_ imageName: String, width: CGFloat = 30, height: CGFloat = 44) {
        let uRightView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        uRightView.image = UIImage.init(named: imageName)
        uRightView.contentMode = .center
        self.rightView = uRightView
        self.rightViewMode = .always
    }
    
    //MARK: - 设置UITextField的rightView
    /// 设置UITextField的rightView
    ///
    /// - Parameters:
    ///   - normalImageName: normal image name
    ///   - width: width
    ///   - height: height
    /// - Returns: 返回rightView
    public func setRightButton(_ normalImageName: String, width: CGFloat = 30, height: CGFloat = 44) -> UIButton {
        let uRightView = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        uRightView.setImage(UIImage.init(named: normalImageName), for: .normal)
        uRightView.contentMode = .center
        self.rightView = uRightView
        self.rightViewMode = .always
        
        return uRightView
    }
}


public extension UITextField {
    var placeholderLabel: UILabel? {
        get {
            guard let ivar = class_getInstanceVariable(self.classForCoder, "_placeholderLabel") else {
                return nil
            }
            return object_getIvar(self, ivar) as? UILabel
        }
    }
     func setPlaceholderColor(_ color: UIColor?) {
        self.placeholderLabel?.textColor = color
    }
}
