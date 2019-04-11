//
//  LoginViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/4/6.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenRect = UIScreen.main.bounds
        
        self.view.backgroundColor = UIColor.white

        //设置关闭页面按钮
        let closeBtn = UIButton(frame: CGRect(x:10, y: 50, width: 50, height: 20))
        self.view.addSubview(closeBtn)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(LoginViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
        }
        
        let userPortrait = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        userPortrait.image = UIImage(named: "头像")
        self.view.addSubview(userPortrait)
        userPortrait.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.top.equalToSuperview().offset(100)
            make.centerX.equalTo(view.snp.centerX)
        }
        userPortrait.layer.masksToBounds = true
        userPortrait.layer.cornerRadius = userPortrait.frame.width/2
        
        let accountTextField = UITextField()
        self.view.addSubview(accountTextField)
        accountTextField.borderStyle = UITextField.BorderStyle.roundedRect
        accountTextField.placeholder = "请输入账号"
        accountTextField.returnKeyType = .continue
        accountTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        accountTextField.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
            make.top.equalTo(userPortrait.snp.bottom).offset(15)
        }
        
        let passwordTextField = UITextField()
        self.view.addSubview(passwordTextField)
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.returnKeyType = .done
        passwordTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordTextField.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.width.equalTo(screenRect.width)
            make.top.equalTo(accountTextField.snp.bottom).offset(1)
        }
        
        let loginBtn = UIButton()
        self.view.addSubview(loginBtn)
        loginBtn.setTitle("登陆", for: .normal)
        loginBtn.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 1.0)
        loginBtn.addTarget(self, action: #selector(LoginViewController.openUserViewController), for: .touchUpInside)
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.width.equalTo(screenRect.width - 60)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        let registBtn = UIButton()
        self.view.addSubview(registBtn)
        registBtn.setTitle("新用户", for: .normal)
        registBtn.setTitleColor(UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 1.0), for: .normal)
        registBtn.addTarget(self, action: #selector(LoginViewController.openRegistViewController), for: .touchUpInside)
        registBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.bottom).offset(-15)
            make.right.equalToSuperview().offset(-10)
        }
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func openUserViewController() {
        let userViewController = UserViewController()
        self.present(userViewController, animated: true, completion: nil)
    }
    
    @objc func openRegistViewController() {
        let registViewController = RegistViewController()
        self.present(registViewController, animated: true, completion: nil)
    }


}
