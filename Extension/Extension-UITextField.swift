//
//  Extension-UITextField.swift
//  iVCoin
//
//  Created by ayong on 2017/11/29.
//  Copyright © 2017年 阿勇. All rights reserved.
//

import UIKit

extension UITextField {
    func act_setLeftImageView(_ imageName: String) {
        let uLeftView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 44))
        uLeftView.image = UIImage.init(named: imageName)
        uLeftView.contentMode = .center
        self.leftView = uLeftView
        self.leftViewMode = .always
    }
    func act_setRightImageView(_ imageName: String) {
        let uRightView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 44))
        uRightView.image = UIImage.init(named: imageName)
        uRightView.contentMode = .center
        self.rightView = uRightView
        self.rightViewMode = .always
    }
    func act_setRightButton(_ normalImageName: String) -> UIButton {
        let uRightView = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 44))
        uRightView.setImage(UIImage.init(named: normalImageName), for: .normal)
        uRightView.contentMode = .center
        self.rightView = uRightView
        self.rightViewMode = .always
        
        return uRightView
    }
}
