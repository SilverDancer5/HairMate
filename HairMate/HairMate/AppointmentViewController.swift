//
//  AppointmentViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/4/1.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let headImag = UIImageView()
        self.view.addSubview(headImag)
        headImag.backgroundColor = UIColor.lightGray
        headImag.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.left.equalToSuperview().offset(40)
            make.top.equalToSuperview().offset(30)
        }
        
        
        
    }
    


}
