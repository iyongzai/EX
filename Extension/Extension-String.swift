//
//  Extension-String.swift
//  ayong
//
//  Created by ayong on 2017/3/9.
//
//

import Foundation
import UIKit


// MARK: 返回String的长度length
extension String {
    var length: Int {return self.count}
}

// MARK: 计算rect
extension String {
    func boundingRect(with size: CGSize, options: NSStringDrawingOptions = [], attributes: [NSAttributedStringKey : Any]? = nil, context: NSStringDrawingContext?) -> CGRect {
        var rect = CGRect.zero
        if self.length == 0 {
            return rect
        }
        let newString = self as NSString
        rect = newString.boundingRect(with: size, options: options, attributes: attributes, context: context)
        
        return rect
    }
}


// MARK: - 正则手机号码
extension String {
//    func isTelNumber()->Bool
//    {
//        let mobile = "^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$"
//        let  CM = "^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"
//        let  CU = "^1(3[0-2]|5[256]|8[56])\\d{8}$"
//        let  CT = "^1((33|53|8[09])[0-9]|349)\\d{7}$"
//        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
//        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
//        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
//        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
//        if ((regextestmobile.evaluate(with: self) == true)
//            || (regextestcm.evaluate(with: self)  == true)
//            || (regextestct.evaluate(with: self) == true)
//            || (regextestcu.evaluate(with: self) == true))
//        {
//            return true
//        } else {
//            return false
//        }
//    }
    func isTelNumber()->Bool
        
    {
        
        let mobile = "^1((3[0-9]|4[57]|5[0-35-9]|7[0678]|8[0-9])\\d{8}$)"
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestmobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if ((regextestmobile.evaluate(with: self) == true)
            
            || (regextestcm.evaluate(with: self)  == true)
            
            || (regextestct.evaluate(with: self) == true)
            
            || (regextestcu.evaluate(with: self) == true))
            
        {
            
            return true
            
        }
            
        else
            
        {
            
            return false
            
        }
        
    }
}




// MARK: - 汉字处理
extension String {
    // MARK: 汉字 -> 拼音
    func chineseToPinyin() -> String {
        
        let stringRef = NSMutableString(string: self) as CFMutableString
        // 转换为带音标的拼音
        CFStringTransform(stringRef,nil, kCFStringTransformToLatin, false)
        // 去掉音标
        CFStringTransform(stringRef, nil, kCFStringTransformStripCombiningMarks, false)
        let pinyin = stringRef as String
        
        return pinyin
    }
    
    // MARK: 判断是否含有中文
    func isIncludeChineseIn() -> Bool {
        
        for (_, value) in self.enumerated() {
            
            if ("\u{4E00}" <= value  && value <= "\u{9FA5}") {
                return true
            }
        }
        
        return false
    }
    
    // MARK: 获取第一个字符
    func first() -> String {
        return String(self.prefix(1))
    }
    
}


extension String {
    //根据开始位置和长度截取字符串
    func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
}
extension String {
    func depth(_ numScale: Int) -> String {
        guard numScale >= 0, numScale <= 20 else {
            return self
        }
        let max = "00000000000000000000"
        if !self.contains(".") {
            return self + "." + max.subString(start: 0, length: numScale)
        }
        let arr = self.components(separatedBy: ".")
        
        return arr[0] + "." + (arr[1] + max).subString(start: 0, length: numScale)
    }
}

extension String {
    // MARK: - 隐藏部分内容，用*代替
    func secureText(location: Int, length: Int) -> String {
        guard location < self.count, length > 0, (location+length) < self.length else {
            return self
        }
        return self.replacingCharacters(in: Range.init(NSRange.init(location: location, length: length), in: self)!, with: String.init(repeating: "*", count: length))
    }
    func togetherLength(_ length: Int) -> String {
        guard length < self.length else {
            return self
        }
        var tmpStr = self
        var arr: [String] = []
        while tmpStr.length > length {
            arr.append(tmpStr.subString(start: 0, length: length))
            tmpStr = tmpStr.subString(start: length)
        }
        if tmpStr.length > 0 {
            arr.append(tmpStr)
        }
        return arr.componentsJoined(by: " ")
    }
    // MARK: - 银行卡号隐藏部分
    func bankCardSecureText() -> String {
        guard validate(rule: "^[0-9]*$", str: self) else {
            return self
        }
        return self.replacingOccurrences(of: " ", with: "").secureText(location: 3, length: self.length-6).togetherLength(4)
    }
}


extension String {
    //Range转换为NSRange
    func nsRange(from range: Range<String.Index>) -> NSRange? {
        let utf16view = self.utf16
        if let from = range.lowerBound.samePosition(in: utf16view), let to = range.upperBound.samePosition(in: utf16view) {
            return NSMakeRange(utf16view.distance(from: utf16view.startIndex, to: from), utf16view.distance(from: from, to: to))
        }
        return nil
    }
    
    //Range转换为NSRange
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location,
                                     limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length,
                                   limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
}



extension String {
    func isPicName() -> Bool {
        return validate(rule: "^(.+?)\\.(png|jpg|jpeg|gif)$", str: self)
    }
    
    /// htmlString修改img，video等标签的宽高
    ///
    /// - Parameters:
    ///   - elem: img, video；注意：传参不需要带"<"字符，否则可能得不到预期结果
    ///   - width: 绝对值如375,或者图片百分比如100%
    ///   - height: 跟width类似
    /// - Returns: 修改后的结果
    func htmlStringElements(_ elem: String, width: String? = nil, height: String? = nil) -> String {
        guard self.contains(elem) else {
            return self
        }
        guard let regex2 = try? NSRegularExpression.init(pattern: "<\(elem)(.*?)>", options: NSRegularExpression.Options.caseInsensitive) else {
            return self
        }
        let array2 = regex2.matches(in: self, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSRange.init(location: 0, length: self.length))
        var dic: [String : String] = [:]
        for b in array2 {
            var str1 = self.subString(start: b.range.location, length: b.range.length)
            let oldValue = str1
            str1 = str1.modifyProperty(elem, property: "height", value: height)
            str1 = str1.modifyProperty(elem, property: "width", value: width)
            let newValue = str1
            if oldValue != newValue {
                dic[oldValue] = newValue
            }
        }
        
        var result = self
        for (oldValue, newValue) in dic {
            result = result.replacingOccurrences(of: oldValue, with: newValue)
        }
        
        
        return result
    }
    fileprivate func modifyProperty(_ elem: String, property: String, value: String?) -> String {
        if self.contains(property) {
            let range = self.nsRange(from: self.range(of: property)!)!
            let tStr = self.subString(start: range.location)
            var arr = tStr.components(separatedBy: "\"")
            //修改width的值
            if value == nil {
                //删除 "width"
                arr.removeFirst()
                //删除 width对应的值
                arr.removeFirst()
            }else{
                arr.remove(at: 1)
                arr.insert(value!, at: 1)
            }
            //重新组装拆分的数据(前半段拼接上去修改width信息的后半段)
            return self.subString(start: 0, length: range.location) + arr.componentsJoined(by: "\"")
        }else if value != nil {
            let range = self.nsRange(from: self.range(of: elem)!)!
            var result = self
            result.insert(contentsOf: " \(property)=\"\(value!)\"", at: self.index(self.startIndex, offsetBy: range.location+range.length))
            return result
        }
        return self
    }
}
