//
//  SettingsViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/4/6.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


        var otherFunNameDict = ["版本更新", "账号绑定"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenRect = UIScreen.main.bounds
        self.view.backgroundColor = UIColor.white
        
        //设置关闭页面按钮
        let closeBtn = UIButton(frame: CGRect(x:10, y: 50, width: 50, height: 20))
        self.view.addSubview(closeBtn)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(FeedbackViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
        }
        
        //功能表单
        let otherFunTableView = UITableView(frame: CGRect(x: 0, y: 100, width: screenRect.width, height: screenRect.height), style: .grouped)
        self.view.addSubview(otherFunTableView)
        otherFunTableView.dataSource = self
        otherFunTableView.delegate = self
        otherFunTableView.isScrollEnabled = false

    
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return otherFunNameDict.count
        }
        else {
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifer = "reusedCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifer)
            cell?.textLabel?.text = otherFunNameDict[(indexPath as NSIndexPath).row]
        }
        cell?.accessoryType = .disclosureIndicator
    
        
        return cell!
    }



}
