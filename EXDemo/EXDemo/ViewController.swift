//
//  ViewController.swift
//  EXDemo
//
//  Created by Tyler.Yin on 2018/9/8.
//  Copyright © 2018年 ayong. All rights reserved.
//

import UIKit
import EX

fileprivate let CellReuseIdentifier = "CellReuseIdentifier"
class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        tableView.rowHeight = 70
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    private var cellModels = ["扩展String",
                              "扩展UIImage",
                              "扩展UINavigationBar",
                              "扩展Double",
                              "扩展Color",
                              "扩展UIView",
                              "扩展UITextField",
                              "扩展Array"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubviews()
        self.addConstraints()
        self.adjustUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
        cell.textLabel?.text = cellModels[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DescViewController()
        vc.fileName = cellModels[indexPath.row] + "介绍.txt"
        
        self.show(vc, sender: nil)
    }
}

extension ViewController: UI {
    func addSubviews() {
        self.view.addSubview(tableView)
    }
    func adjustUI() {
        self.navigationItem.title = "EXDemo"
        self.view.backgroundColor = UIColor.viewBG
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackground(UIColor.navBGColor)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 24), NSAttributedString.Key.foregroundColor : UIColor.white]
        tableView.backgroundColor = UIColor.tableViewBG
        
    }
    func addConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
