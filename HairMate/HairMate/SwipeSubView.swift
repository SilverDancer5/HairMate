//
//  SwipeView.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/20.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit
import SnapKit


class SwipeSubView: UIView {
    

    var shopImageView: UIImageView!
    var shopNameLabel: UILabel!
    var phoneLable: UILabel!
    var adressLabel: UILabel!
    var workTimeLabel: UILabel!
    var seatNumLabel: UILabel!
    var recommendTonyLabel: UILabel!
    var tonyImageView: UIImageView!
    var tonyInfoLabel: UILabel!
    var appointmentBtn: UIButton!
    var tonyNameLabel: UILabel!
    var styleLabel: UILabel!
    var appointmentNumLabel: UILabel!
    var appointmentNumBtn: UIButton!
    var waitTimeLabel: UILabel!
    var waitTimeBtn: UIButton!
    var guideBtn: UIButton!
    var crtPeopleNum: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubView() {
        
        shopImageView = UIImageView()
        shopImageView.image = UIImage(named: "shopImage")
        self.addSubview(shopImageView)
        shopImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        shopNameLabel = UILabel()
        shopNameLabel.text = "东东美容美发店"
        shopNameLabel.textAlignment = .left
        self.addSubview(shopNameLabel)
        shopNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-20)
        }
        
        phoneLable = UILabel()
        phoneLable.text = "预约电话：1234567890"
        phoneLable.font = UIFont.systemFont(ofSize: 10)
        phoneLable.textAlignment = .left
        self.addSubview(phoneLable)
        phoneLable.snp.makeConstraints { (make) in
            make.left.equalTo(shopNameLabel.snp.left)
            make.top.equalTo(shopNameLabel.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(24)
        }
        
        adressLabel = UILabel()
        adressLabel.numberOfLines = 0
        adressLabel.lineBreakMode = .byTruncatingTail
        adressLabel.font = UIFont.systemFont(ofSize: 10)
        adressLabel.text = "地址：南京市江宁区弘景大道99号文鼎广场3幢"
        self.addSubview(adressLabel)
        adressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(phoneLable.snp.left)
            make.top.equalTo(phoneLable.snp.bottom).offset(10)
            make.width.equalTo(120)
            make.height.equalTo(24)
        }
        
        
        crtPeopleNum = UILabel()
        var peopleNum = 10
        crtPeopleNum.text = "当前人数 \(peopleNum)"
        crtPeopleNum.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(crtPeopleNum)
        crtPeopleNum.snp.makeConstraints { (make) in
            make.left.equalTo(adressLabel.snp.left)
            make.top.equalTo(adressLabel.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(24)
            
        }
        
        
        seatNumLabel = UILabel()
        seatNumLabel.text = "座位数：20"
        seatNumLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(seatNumLabel)
        seatNumLabel.snp.makeConstraints { (make) in
            make.left.equalTo(adressLabel.snp.left)
            make.top.equalTo(crtPeopleNum.snp.bottom).offset(10)
            make.width.equalTo(150)
            make.height.equalTo(24)
        }
        
        appointmentBtn = UIButton()
        appointmentBtn.setTitle("预约", for: .normal)
        appointmentBtn.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 1.0)
        appointmentBtn.layer.cornerRadius = 2

        self.addSubview(appointmentBtn)
        appointmentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(shopImageView.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(50)
            make.height.equalTo(24)
            make.width.equalTo(100)

        }

        
        guideBtn = UIButton()
        guideBtn.setTitle("导航", for: .normal)
        guideBtn.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 1.0)
        guideBtn.layer.cornerRadius = 2
        self.addSubview(guideBtn)
        guideBtn.snp.makeConstraints { (make) in
            make.top.equalTo(shopImageView.snp.bottom).offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(24)
            make.width.equalTo(100)
            
        }
        
        recommendTonyLabel = UILabel()
        recommendTonyLabel.text = "推荐Tony:"
        self.addSubview(recommendTonyLabel)
        recommendTonyLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(guideBtn.snp.bottom).offset(20)
            make.width.equalTo(150)
            make.height.equalTo(24)
        }
        
        tonyImageView = UIImageView()
        tonyImageView.image = UIImage(named: "smithImg")
        self.addSubview(tonyImageView)
        tonyImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(recommendTonyLabel.snp.bottom).offset(20)
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
    }
    


}
