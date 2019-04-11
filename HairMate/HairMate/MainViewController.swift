//
//  MainViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/12.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit
import SnapKit


class MainViewController: UIViewController, CycleViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {


    let bgview = UIView()
    var collectionView : UICollectionView!
    
    let groupCount = 100 // 制造100组数据，给无限滚动提供足够多的数据，嫌少可以200，1000。。。
    var imageArr = [String]() // 图片数组
    var indexArr = [Int]() // 存储图片下标，解决制造100组图片数据占用过大内存问题
    
    //实现代理
    func CycleViewItemClick(_ collectionView: UICollectionView, selectedItem item: Int) {
        print(item)
    }
    
    
    
    var scrollView = UIScrollView()
    let cycleImageArrForRecommendShop = ["理发店1", "理发店2", "理发店3", "理发店4"]
    private var recommendCollectionView:UICollectionView?
    private var layout:CustomLayout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        
        
        self.view.backgroundColor = UIColor.white
        self.title = "主页"
        
        
        
        
        let screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame.size.width
        let screenHeight = screenFrame.size.height
        // MARK: 设置页面滚动视图
        scrollView.frame = screenFrame
        scrollView.contentSize = CGSize(width: screenWidth, height: screenHeight * 2)
        scrollView.isPagingEnabled = false
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self 
        
        self.view.addSubview(scrollView)
        
        // MARK: 设置海报轮播
        let cycleImageArrForPoster = ["首页1", "首页2", "首页3"]
        let posterCycleViewRect = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*9/20)
        let posterCycleView =  CycleView(frame: posterCycleViewRect, imageNames: cycleImageArrForPoster,timeInterval:3)
        posterCycleView.delegate = self
        scrollView.addSubview(posterCycleView)
        
        // MARK: 定位功能按钮
        let shopLocationBtn = UIButton(frame: CGRect(x: 40, y: 200, width: 50, height: 50))
        shopLocationBtn.setTitle("门店定位", for: .normal)
        shopLocationBtn.setTitleColor(UIColor.black, for: .normal)
        shopLocationBtn.setImage(UIImage(named: "门店定位"), for: .normal)
        shopLocationBtn.addTarget(self, action: #selector(MainViewController.openMapViewController), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(shopLocationBtn)
        
        // MARK: 试发型功能按钮
        let hairTryBtn = UIButton(frame: CGRect(x: 120, y: 200, width: 50, height: 50))
        
        hairTryBtn.setTitle("试发型", for: .normal)
        hairTryBtn.setTitleColor(UIColor.black, for: .normal)
        hairTryBtn.setImage(UIImage(named: "试发型"), for: .normal)
        hairTryBtn.addTarget(self, action: #selector(MainViewController.openChangeHairViewController), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(hairTryBtn)
        
        // MARK: 发型设计功能按钮
        let hairDesignBtn = UIButton(frame: CGRect(x: 200, y: 200, width: 40, height: 40))
        hairDesignBtn.setTitle("发型设计", for: .normal)
        hairDesignBtn.setTitleColor(UIColor.black, for: .normal)
        hairDesignBtn.addTarget(self, action: #selector(MainViewController.openHairDesignViewController), for: UIControl.Event.touchUpInside)
        hairDesignBtn.setImage(UIImage(named: "发型设计"), for: .normal)
        scrollView.addSubview(hairDesignBtn)
        
        // MARK: 测脸型功能按钮
        let faceShapBtn = UIButton(frame: CGRect(x: 280, y: 200, width: 40, height: 40))
        faceShapBtn.setTitle("测脸型", for: .normal)
        faceShapBtn.setTitleColor(UIColor.black, for: .normal)
        faceShapBtn.setImage(UIImage(named: "测脸型"), for: .normal)
        faceShapBtn.addTarget(self, action: #selector(MainViewController.openFaceShapViewController), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(faceShapBtn)
        
        // MARK: 推荐店铺标题
        let recommendShopBtn = UIButton(frame: CGRect(x: 140, y: 250, width: 100, height: 50))
        recommendShopBtn.setTitle("推荐店铺", for: .normal)
        recommendShopBtn.setTitleColor(UIColor.black, for: .normal)
        scrollView.addSubview(recommendShopBtn)
        
        // MARK: 设置推荐门店轮播
        makeUI()
        // 设置数据源
        imageArr = ["理发店1", "理发店2", "理发店3", "理发店4"]
        for _ in 0 ..< groupCount {
            for j in 0 ..< imageArr.count {
                indexArr.append(j)
            }
        }
        // 定位到 第50组(中间那组)
        collectionView.scrollToItem(at: NSIndexPath.init(item: groupCount / 2 * imageArr.count, section: 0) as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
        
        
        
        
        
        
        // MARK: 猜你喜欢标题
        let guessYouLikeBtn = UIButton(frame: CGRect(x: 140, y: 550, width: 100, height: 50))
        scrollView.addSubview(guessYouLikeBtn)
        guessYouLikeBtn.setTitle("猜你喜欢", for: .normal)
        guessYouLikeBtn.setTitleColor(UIColor.black, for: .normal)
        
        // MARK: 猜你喜欢
        let TonyView = CardView(frame: CGRect(x: 0, y: 600, width: screenFrame.width, height: 250))
        TonyView.layer.cornerRadius = 20
        TonyView.layer.masksToBounds = true
        TonyView.backgroundColor = UIColor(red: 242/255.0, green: 243/255.0, blue: 248/255.0, alpha: 1.0)
        TonyView.setupSubView(Image: UIImage(named: "发型师1")!, Name: "Tony", HariDesignPrice: 38.00, FaceShapAnalysisPrice: 18.00, ImageDesignPrice: 58.00)
        scrollView.addSubview(TonyView)
        
        let Tony2View = CardView(frame: CGRect(x: 0, y: TonyView.center.y + 130, width: screenFrame.width, height: 250))
        Tony2View.layer.cornerRadius = 20
        Tony2View.layer.masksToBounds = true
        Tony2View.backgroundColor = UIColor(red: 242/255.0, green: 243/255.0, blue: 248/255.0, alpha: 1.0)
        Tony2View.setupSubView(Image: UIImage(named: "发型师2")!, Name: "首席设计师", HariDesignPrice: 38.00, FaceShapAnalysisPrice: 18.00, ImageDesignPrice: 58.00)
        scrollView.addSubview(Tony2View)


    }
    
    
    // MARK: 打开地图视图
    @objc func openMapViewController() {
        let mapViewController = MapViewController()
        self.present(mapViewController,animated: true, completion: nil)
        
    }
    
    // MARK: 打开换发视图
    @objc func openChangeHairViewController() {
        let changeHairViewController = ChangeHairViewController()
        self.present(changeHairViewController,animated: true, completion: nil)
        
    }
    
    // MARK: 打开发型设计
    @objc func openHairDesignViewController() {
        
        let hairDesignViewContrller = HairDesignViewController()
        self.present(hairDesignViewContrller, animated: true, completion: nil )
    }
    
    // MARK: 打开侧脸型
    @objc func openFaceShapViewController() {
        let faceShapViewController = FaceShapViewController()
        self.present(faceShapViewController,animated: true, completion: nil)

    }
    
    

    // MARK:- UI
    func makeUI() {
        
        bgview.frame = CGRect(x: 0, y: 300, width: UIScreen.main.bounds.size.width, height: 240)
        bgview.backgroundColor = UIColor.clear
        scrollView.addSubview(bgview)
        
        setupCollection()
        
    }
    
    func setupCollection() {
        
        let padding = 20 * UIScreen.main.bounds.size.width/375
        
        let layout = CyclicCardFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
        let itemW = (UIScreen.main.bounds.size.width - padding * 2) * 0.5
        layout.itemSize = CGSize(width: itemW, height: bgview.frame.height - padding * 2)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: bgview.frame.height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CyclicCardCell.self, forCellWithReuseIdentifier: NSStringFromClass(CyclicCardCell.self))
        bgview.addSubview(self.collectionView)
    }
    
    
    // MARK:- CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CyclicCardCell.self), for: indexPath) as! CyclicCardCell
        
        let index = indexArr[indexPath.row]
        cell.cardImgView.image = UIImage(named: imageArr[index])
        return cell
    }
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pointInView = view.convert(collectionView.center, to: collectionView)
        let indexPathNow = collectionView.indexPathForItem(at: pointInView)
        let index = (indexPathNow?.row ?? 0) % imageArr.count
        
        
        // 动画停止, 重新定位到 第50组(中间那组) 模型
        collectionView.scrollToItem(at: NSIndexPath.init(item: groupCount / 2 * imageArr.count + index, section: 0) as IndexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: false)
    }
    

    
}


