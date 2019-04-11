//
//  RecommeCardView.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/19.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit
import SnapKit

class CardView: UIView {

    var headImgView: UIImageView?
    var nameLabel: UILabel?
    var freeAdviceBtn: UIButton?
    var orderNumLabel: UILabel?
    var commentNumLabel: UILabel?
    var signLabel: UILabel?
    var hairDesingLabel: UILabel?
    var faceShapAnalysisLabel: UILabel?
    var imageDesignLabel: UILabel?
    var btn1 = UIButton()
    var btn2 = UIButton()
    var btn3 = UIButton()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView(Image: UIImage(named: "user")!, Name: "", HariDesignPrice: 0.00, FaceShapAnalysisPrice: 0.00, ImageDesignPrice: 0.00)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView(Image: UIImage, Name: String, HariDesignPrice: CGFloat, FaceShapAnalysisPrice: CGFloat, ImageDesignPrice: CGFloat) {
        let frame = self.bounds
        
        //免费咨询按钮
        freeAdviceBtn = UIButton(frame: CGRect(x: frame.size.width - 100, y: 40, width: 60, height: 24))
        freeAdviceBtn?.setTitle("免费咨询", for: .normal)
        freeAdviceBtn?.setTitleColor(UIColor.black, for: UIControl.State.normal)
        freeAdviceBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        freeAdviceBtn?.backgroundColor = UIColor(red: 255/255, green: 235/255, blue: 205/255, alpha: 1.0)
        self.addSubview(freeAdviceBtn!)
        
        //头像
        headImgView = UIImageView(frame: CGRect(x: 40, y: 30, width: 60, height: 60))
        headImgView?.backgroundColor = UIColor.gray
        headImgView?.layer.masksToBounds = true
        headImgView?.layer.cornerRadius = (headImgView?.frame.width)!/2
        headImgView?.image = Image
        self.addSubview(headImgView!)
        
        //姓名
        nameLabel = UILabel(frame: CGRect(x: 120, y: 30, width: 100, height: 24))
        nameLabel?.text = Name
        self.addSubview(nameLabel!)
        
        //接单量
        orderNumLabel = UILabel(frame: CGRect(x: 120, y: 55, width: 50, height: 24))
        orderNumLabel?.text = "接单：99"
        orderNumLabel?.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(orderNumLabel!)
        
        //评论
        commentNumLabel = UILabel(frame: CGRect(x: 170, y: 55, width: 50, height: 24))
        commentNumLabel?.text = "评论：99"
        commentNumLabel?.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(commentNumLabel!)
        
        //个性签名
        signLabel = UILabel(frame: CGRect(x: 40, y: 90, width: 200, height: 20))
        signLabel?.font = UIFont.systemFont(ofSize: 9)
        signLabel?.text = "这个人很懒什么都没有留下"
        self.addSubview(signLabel!)
        
        //发型设计
        hairDesingLabel = UILabel(frame: CGRect(x: 50, y: 110, width: frame.size.width - 50, height: 30))
        hairDesingLabel?.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 255/255, alpha: 1.0)
        hairDesingLabel?.center.x = self.center.x
        let hairDesignPrice = HariDesignPrice
        hairDesingLabel?.text = "\t发型设计\t\t\t\t￥\(hairDesignPrice)"
        hairDesingLabel?.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(hairDesingLabel!)
        
        btn1 = UIButton(frame: CGRect(x: 300, y: 110, width: 50, height: 24))
        btn1.setTitle("下单", for: .normal)
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn1.setTitleColor(UIColor.blue, for: .normal)
        self.addSubview(btn1)
        
        
        
        //脸型分析
        faceShapAnalysisLabel = UILabel(frame: CGRect(x: 50, y: 150, width: frame.size.width - 50, height: 30))
        faceShapAnalysisLabel?.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 255/255, alpha: 1.0)
        faceShapAnalysisLabel?.center.x = self.center.x
        let faceShapAnalysisPrice = FaceShapAnalysisPrice
        faceShapAnalysisLabel?.text = "\t脸型分析\t\t\t\t￥\(faceShapAnalysisPrice)"
        faceShapAnalysisLabel?.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(faceShapAnalysisLabel!)
        
        btn2 = UIButton(frame: CGRect(x: 300, y: 150, width: 50, height: 24))
        btn2.setTitle("下单", for: .normal)
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn2.setTitleColor(UIColor.blue, for: .normal)
        self.addSubview(btn2)
        
        //形象设计
        imageDesignLabel = UILabel(frame: CGRect(x: 50, y: 190, width: frame.size.width - 50, height: 30))
        imageDesignLabel?.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 255/255, alpha: 1.0)
        imageDesignLabel?.center.x = self.center.x
        let imageDesignPricr = ImageDesignPrice
        imageDesignLabel?.text = "\t形象设计\t\t\t\t￥\(imageDesignPricr)"
        imageDesignLabel?.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(imageDesignLabel!)
        
        btn3 = UIButton(frame: CGRect(x: 300, y: 190, width: 50, height: 24))
        btn3.setTitle("下单", for: .normal)
        btn3.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        btn3.setTitleColor(UIColor.blue, for: .normal)
        self.addSubview(btn3)
        
    }
    
}
