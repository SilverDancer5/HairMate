//
//  FeedbackViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/4/6.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 240/255, alpha: 1.0)
        //设置关闭页面按钮
        let closeBtn = UIButton(frame: CGRect(x:10, y: 50, width: 50, height: 20))
        self.view.addSubview(closeBtn)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(FeedbackViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
        }
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 24))
        self.view.addSubview(titleLabel)
        titleLabel.center.x = self.view.center.x
        titleLabel.text = "意见反馈"
        
        let feedbackTextField = UITextField()
        self.view.addSubview(feedbackTextField)
        feedbackTextField.borderStyle = UITextField.BorderStyle.roundedRect
        feedbackTextField.placeholder = "请将你们的想法告诉我们哦～"
        feedbackTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.height.equalTo(200)
            make.width.equalTo(self.view.frame.width - 30)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        let phoneTextField = UITextField()
        self.view.addSubview(phoneTextField)
        phoneTextField.borderStyle = UITextField.BorderStyle.roundedRect
        phoneTextField.placeholder = "壮士请留下你的微信号吧"
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(feedbackTextField.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(self.view.frame.width - 30)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        let tipsLabel = UILabel()
        self.view.addSubview(tipsLabel)
        tipsLabel.text = "tips: 如果我们采用了您的想法， 一定会厚厚的奖励壮士"
        tipsLabel.font = UIFont.systemFont(ofSize: 10)
        tipsLabel.snp.makeConstraints { (make) in
            make.left.equalTo(phoneTextField.snp.left)
            make.top.equalTo(phoneTextField.snp.bottom).offset(15)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    

 

}
