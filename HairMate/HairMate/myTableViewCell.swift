//
//  myTableViewCell.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/13.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    var cellImage: UIImageView!
    var cellText: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //图片
        self.cellImage = UIImageView(image: UIImage(named: "user"))
        self.cellImage.center = CGPoint(x: 40, y: 40)
        
        //标签
        self.cellText = UILabel(frame: CGRect(x: 250, y: 0, width: 120, height: 40))
        self.cellText.text = "自定义发型名称"
        
        
        self.addSubview(cellImage)
        self.addSubview(cellText)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //选中后操作
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
