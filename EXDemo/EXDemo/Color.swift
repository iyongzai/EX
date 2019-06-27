//
//  Color.swift
//  EXDemo
//
//  Created by zhiyong yin on 2019/6/27.
//  Copyright © 2019 ayong. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let ivTheme          = UIColor.init(red: 36.0/255.0, green: 39.0/255.0, blue: 54.0/255.0, alpha: 1)//主题深蓝
    static let ivText           = "#8A98BD".uiColor()
    static let ivSelectedBG     = "#32374F".uiColor()
    static let ivRedBtnBG       = "#DC4D4D".uiColor()
    static let ivGreenBtnBG     = "#03C189".uiColor()
    static let ivRedText        = "#FD3E3E".uiColor()
    static let ivGreenText      = "#1FE5B6".uiColor()
    static let ivTabBarBG       = "#30344A".uiColor()
    static let ivBlueText       = "#409DFF".uiColor()
    
    
    static let themeBlue        = "#00A8FF".uiColor()//主题蓝
    static let themeBlack       = "#2F4053".uiColor()//主题黑
    static let iRed             = "#DE1322".uiColor().withAlphaComponent(0.7)
    static let iGreen           = "#21B68A".uiColor().withAlphaComponent(0.7)
    static let gray240          = "#F0F0F0".uiColor()//rgb:240,240,240
    static let color333333      = "#333333".uiColor()
    static let color666666      = "#666666".uiColor()
    static let color999999      = "#999999".uiColor()
    
    
    static let theme            = ivTheme//主题色
    static let navBGColor       = ivTheme//顶部导航栏背景颜色
    static let tabBarBG         = ivTabBarBG//底部导航栏背景
    static let text             = ivText
    static let redBtnBG         = ivRedBtnBG
    static let greenBtnBG       = ivGreenBtnBG
    static let redText          = ivRedText
    static let greenText        = ivGreenText
    static let selectedBG       = ivSelectedBG
    static let viewBG           = ivTheme
    static let tableViewBG      = ivTheme
    static let blueText         = ivBlueText
}
