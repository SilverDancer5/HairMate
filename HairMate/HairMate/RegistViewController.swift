//
//  RegistViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/4/6.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class RegistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        let screenRect = UIScreen.main.bounds
        
        
        //设置关闭页面按钮
        let backBtn = UIButton(frame: CGRect(x:10, y: 50, width: 50, height: 20))
        self.view.addSubview(backBtn)
        backBtn.setTitle("返回", for: .normal)
        backBtn.setTitleColor(UIColor.black, for: .normal)
        backBtn.addTarget(self, action: #selector(LoginViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        backBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
        }
        
        let IDTextField = UITextField()
        self.view.addSubview(IDTextField)
        IDTextField.placeholder = "学号"
        IDTextField.backgroundColor = UIColor.white
        IDTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
        }
        
        let passwordTextField = UITextField()
        self.view.addSubview(passwordTextField)
        passwordTextField.placeholder = "密码"
        passwordTextField.backgroundColor = UIColor.white
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(IDTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
        }
        
        let confirmPasswordTextField = UITextField()
        self.view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.placeholder = "确认密码"
        confirmPasswordTextField.backgroundColor = UIColor.white
        confirmPasswordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
        }
        
        let nameTextField = UITextField()
        self.view.addSubview(nameTextField)
        nameTextField.placeholder = "姓名"
        nameTextField.backgroundColor = UIColor.white
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
        }
        
        let schoolTextField = UITextField()
        self.view.addSubview(schoolTextField)
        schoolTextField.placeholder = "<请选择学校>"
        schoolTextField.backgroundColor = UIColor.white
        schoolTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
        }
        
        let classTextField = UITextField()
        self.view.addSubview(classTextField)
        classTextField.placeholder = "<请选择班级>"
        classTextField.backgroundColor = UIColor.white
        classTextField.snp.makeConstraints { (make) in
            make.top.equalTo(schoolTextField.snp.bottom).offset(1)
            make.centerX.equalTo(self.view.snp.centerX)
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
        }
        
        let registBtn = UIButton()
        self.view.addSubview(registBtn)
        registBtn.setTitle("注册", for: .normal)
        registBtn.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 1.0)
        registBtn.addTarget(self, action: #selector(RegistViewController.dismissSelf), for:  .touchUpInside)
        registBtn.snp.makeConstraints { (make) in
            make.top.equalTo(classTextField.snp.bottom).offset(15)
            make.width.equalTo(screenRect.width - 60)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
    


}
