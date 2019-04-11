//
//  HairDesignViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/19.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class HairDesignViewController: UIViewController, UIScrollViewDelegate {
    
    let TonysName = ["Tony总监", "首席总监"]
    var scrollView = UIScrollView()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let screenFrame = UIScreen.main.bounds
        
        // MARK: 设置页面滚动视图
        scrollView.frame = screenFrame
        scrollView.contentSize = CGSize(width: screenFrame.width, height: screenFrame.height * 2)
        scrollView.isPagingEnabled = false
        scrollView.backgroundColor = UIColor(red: 240/255, green: 255/255, blue: 255/255, alpha: 1.0)
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        //关闭按钮
        let closeBtn = UIButton(frame: CGRect(x: 0, y: 20, width: 50, height: 20))
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(HairDesignViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(closeBtn)
        
        
        let TonyView = CardView(frame: CGRect(x: 0, y: 50, width: screenFrame.width, height: 250))
        TonyView.layer.cornerRadius = 20
        TonyView.layer.masksToBounds = true
        TonyView.backgroundColor = UIColor.white
        TonyView.setupSubView(Image: UIImage(named: "发型师1")!, Name: "Tony", HariDesignPrice: 38.00, FaceShapAnalysisPrice: 18.00, ImageDesignPrice: 58.00)
        scrollView.addSubview(TonyView)
        
        let Tony2View = CardView(frame: CGRect(x: 0, y: TonyView.center.y + 130, width: screenFrame.width, height: 250))
        Tony2View.layer.cornerRadius = 20
        Tony2View.layer.masksToBounds = true
        Tony2View.backgroundColor = UIColor.white
        Tony2View.setupSubView(Image: UIImage(named: "发型师2")!, Name: "首席设计师", HariDesignPrice: 38.00, FaceShapAnalysisPrice: 18.00, ImageDesignPrice: 58.00)
        scrollView.addSubview(Tony2View)
        

    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    

    

}
