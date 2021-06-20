//
//  DescViewController.swift
//  EXDemo
//
//  Created by Tyler.Yin on 2018/9/8.
//  Copyright © 2018年 ayong. All rights reserved.
//

import UIKit
import SnapKit
import EX

class DescViewController: UIViewController {
    
    fileprivate lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        
        
        return textView
    }()
    
    var fileName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
        self.addConstraints()
        self.adjustUI()
        
        self.loadContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func loadContent() {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: nil), let content = try? String.init(contentsOfFile: filePath) {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = 20
            let attr = NSAttributedString.init(string: content, attributes: [NSAttributedString.Key.font : UIFont.init(name: "PingFangSC-Medium", size: 14)!, NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.paragraphStyle : paragraphStyle])
            textView.attributedText = attr
        }
        
    }
}


extension DescViewController: UI {
    func addSubviews() {
        self.view.addSubview(textView)
    }
    func addConstraints() {
        textView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    func adjustUI() {
        self.navigationItem.title = fileName
        self.view.backgroundColor = UIColor.viewBG
        textView.backgroundColor = UIColor.clear
    }
}
