//
//  CommunityViewCard.swift
//  HairMate
//
//  Created by 1320-hym on 2019/4/6.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit
import SnapKit

class CommunityViewCard: UIView {

    
    var headImgView = UIImageView()
    var nameLabel = UILabel()
    var thingLabel = UILabel()
    var timeLabel = UILabel()
    var schoolLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        
        setupCommunityView()
        setName(name: "")
        setHeadImg(img: UIImage(named: "user")!)
        setThing(thing: "")
        setTime(time: "")
        setSchool(school: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupCommunityView() {
        
        //头像
        headImgView = UIImageView(frame: CGRect(x: 40, y: 30, width: 60, height: 60))
        headImgView.backgroundColor = UIColor.gray
        headImgView.layer.masksToBounds = true
        headImgView.layer.cornerRadius = (headImgView.frame.width)/2
        self.addSubview(headImgView)
        headImgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(40)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        
        //姓名
        nameLabel = UILabel(frame: CGRect(x: 120, y: 30, width: 100, height: 24))
        self.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headImgView.snp.top)
            make.left.equalToSuperview().offset(120)
            make.height.equalTo(24)
            make.width.equalTo(100)
        }
        
        //时间
        timeLabel = UILabel()
        self.addSubview(timeLabel)
        timeLabel.font = UIFont.systemFont(ofSize: 8)
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).offset(20)
            make.left.equalTo(nameLabel.snp.left)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        
        schoolLabel = UILabel()
        self.addSubview(schoolLabel)
        schoolLabel.font = UIFont.systemFont(ofSize: 8)
        schoolLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel).offset(15)
            make.left.equalTo(timeLabel.snp.left)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
        
        //说说
        thingLabel = UILabel()
        self.addSubview(thingLabel)
        thingLabel.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        thingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headImgView.snp.bottom).offset(15)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(130)
            make.width.equalTo(self.frame.width - 30)
        }
        
    }
    
    func setHeadImg(img: UIImage) {
        headImgView.image = img
    }
    
    func setName(name: String) {
        nameLabel.text = name
    }
    
    func setThing(thing: String) {
        thingLabel.text = thing
    }
    
    func setTime(time: String) {
        timeLabel.text = time
    }
    
    func setSchool(school: String) {
        schoolLabel.text = school
    }

}
