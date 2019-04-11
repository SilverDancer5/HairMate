//
//  MapViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/12.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    

    var selectedAnnotion: MKAnnotation!
    var locationManager: CLLocationManager!
    var mapView: MKMapView!
    var swipeView: UIView!
    var isTouchSeondView: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.width
        let screenHeight = screenRect.height
        
        //设置关闭页面按钮
        let closeBtn = UIButton(frame: CGRect(x:10, y: 50, width: 50, height: 20))
        self.view.addSubview(closeBtn)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(MapViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        
        //设置地图
        mapView = MKMapView(frame: CGRect(x:0, y: 80, width: screenRect.width, height: screenRect.height))
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        //地图上视图
        mapView.showsScale = true
        mapView.showsTraffic = false
        mapView.showsPointsOfInterest = false
        mapView.showsUserLocation = true
        
        //用户定位
        self.mapView.showsUserLocation = true
        self.mapView.userLocation.title = "我在这里"
        self.mapView.delegate = self
        self.view.addSubview(mapView)
        

        //上滑页面
        swipeView = UIView(frame: CGRect(x: 0, y: screenHeight - 100, width: screenWidth, height: screenHeight - 30))
        swipeView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 255/255, alpha: 0.2)
        swipeView.layer.cornerRadius = 20
        swipeView.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner , CACornerMask.layerMaxXMinYCorner]
        swipeView.layer.masksToBounds = true
        
        self.view.addSubview(self.swipeView)
        self.view.bringSubviewToFront(swipeView)
        
        //创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        swipeView.addSubview(blurView)
        
        //店铺详情
        let shopDetailView = SwipeSubView(frame: CGRect(x: 0, y: 0, width: swipeView.frame.size.width, height: swipeView.frame.size.height))
        swipeView.addSubview(shopDetailView)
        
        
    

}

    //关闭页面方法
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //地图协议实现
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        mapView.userTrackingMode = .followWithHeading
    }
    
    //触摸方法开始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        
        if self.swipeView.frame.contains(touchPoint!) {
            //            print("touch it already")
            isTouchSeondView = true
        }

        
    }
    
    //swipeView上滑
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !isTouchSeondView {
            return
        }
        
        
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        let touchPrePoint = touch?.previousLocation(in: self.self.view)
        let disY = (touchPoint?.y)! - (touchPrePoint?.y)!
        
        
        var SecondCenterPointY = self.swipeView.center.y
        
        SecondCenterPointY += disY
        self.swipeView.center.y = SecondCenterPointY
        
        
        
    }
    
    //触摸方法结束
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let SecondCenterPointY = self.swipeView.center.y
        let aPoint = self.view.center.y + 600
        let bPoint = self.view.center.y + 30
        let cPoint = (aPoint + bPoint) / 2
        let dPoint = (aPoint + cPoint) / 2
        let ePoint = (cPoint + bPoint) / 2
        
        if(SecondCenterPointY >= dPoint && SecondCenterPointY < aPoint) {
            self.swipeView.center.y = aPoint
        }
        if(SecondCenterPointY >= ePoint && SecondCenterPointY < dPoint) {
            self.swipeView.center.y = cPoint
        }
        if(SecondCenterPointY < ePoint) {
            self.swipeView.center.y = bPoint
        }
        
        
        isTouchSeondView = false
    }
    

    
    
    
    
}
