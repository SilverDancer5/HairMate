

import UIKit

class MessageViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        let screenFrame = UIScreen.main.bounds
        //设置消息数量
        self.tabBarItem.badgeValue = "8"
        
        
        // MARK: 设置页面滚动视图
        scrollView.frame = screenFrame
        scrollView.contentSize = CGSize(width: screenFrame.width, height: screenFrame.height * 2)
        scrollView.isPagingEnabled = false
        scrollView.backgroundColor = UIColor(red: 74/255.0, green: 163/255.0, blue: 243/255.0, alpha: 1.0)
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
     
        
        let stdView1 = CommunityViewCard(frame: CGRect(x: 0, y: 50, width: screenFrame.width, height: 250))
        scrollView.addSubview(stdView1)
        stdView1.layer.cornerRadius = 20
        stdView1.layer.masksToBounds = true
        stdView1.backgroundColor = UIColor.white
        stdView1.setupCommunityView()
        stdView1.setHeadImg(img: UIImage(named: "头像")!)
        stdView1.setName(name: "小花花")
        stdView1.setTime(time: "4/5 12:00")
        stdView1.setSchool(school: "金陵科技学院")
        stdView1.setThing(thing: "今天好无聊啊。。。。。。。")
        
        
        let stdView2 = CommunityViewCard(frame: CGRect(x: 0, y: stdView1.centerY+150, width: screenFrame.width, height: 250))
        scrollView.addSubview(stdView2)
        stdView2.layer.cornerRadius = 20
        stdView2.layer.masksToBounds = true
        stdView2.backgroundColor = UIColor.white
        stdView2.setupCommunityView()
        stdView2.setHeadImg(img: UIImage(named: "头像")!)
        stdView2.setName(name: "小草草")
        stdView2.setTime(time: "4/5 17:59")
        stdView2.setSchool(school: "金陵科技学院")
        stdView2.setThing(thing: "今天不无聊不想学习。。。。。。。")
        
        let stdView3 = CommunityViewCard(frame: CGRect(x: 0, y: stdView2.centerY+150, width: screenFrame.width, height: 250))
        scrollView.addSubview(stdView3)
        stdView3.layer.cornerRadius = 20
        stdView3.layer.masksToBounds = true
        stdView3.backgroundColor = UIColor.white
        stdView3.setupCommunityView()
        stdView3.setHeadImg(img: UIImage(named: "头像")!)
        stdView3.setName(name: "大树树")
        stdView2.setSchool(school: "金陵科技学院")
        stdView2.setTime(time: "4/5 9:00")
        stdView3.setThing(thing: "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊。。。。。。。")
        
    }
    

    
    
}
