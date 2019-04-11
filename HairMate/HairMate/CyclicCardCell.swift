//
//  CyclicCardCell.swift
//  CyclicCard
//
//  Created by Tony on 17/1/11.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class CyclicCardCell: UICollectionViewCell {
    
    
    let cardImgView = UIImageView()
    let cardNameLabel = UILabel()
    
    override  init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 242/255.0, green: 243/255.0, blue: 248/255.0, alpha: 1.0)
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
        
        self.addSubview(cardImgView)
        cardImgView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
