//
//  Extension-UINavigationBar.swift
//  iVCoin
//
//  Created by Tyler.Yin on 2017/11/30.
//  Copyright © 2017年 阿勇. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func setBackground(_ color: UIColor) {
        self.setBackgroundImage(color.image(), for: .any, barMetrics: .default)
    }
    func setShadowVisible(_ visible: Bool) {
        self.shadowImage = visible ? nil : UIImage()
    }
}
