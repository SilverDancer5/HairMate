
import UIKit

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var otherFunNameDict = ["HairMate交流群", "意见反馈", "设置"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        
        //获取屏幕相关信息
        let screenRect = UIScreen.main.bounds

        //设置标题
        let userViewTitle = UILabel(frame: CGRect(x: 0, y: 20, width: 100, height: 10))
        userViewTitle.center.x = self.view.center.x
        userViewTitle.text = "我的主页"
        userViewTitle.textColor = UIColor.white
        self.view.addSubview(userViewTitle)

        //设置卡片视图
        let cardView = UIView(frame: CGRect(x: 0, y: 50, width: screenRect.width-50, height: 50))
        cardView.backgroundColor = UIColor.brown
        cardView.layer.cornerRadius = 10
        cardView.layer.masksToBounds = true
        self.view.addSubview(cardView)
        cardView.snp.makeConstraints { (make) in
            make.height.equalTo(150)
            make.width.equalTo(screenRect.width-50)
            make.top.equalToSuperview().offset(50)
            make.centerX.equalTo(self.view.snp.centerX)
        }

        //用户头像
        let userPortrait = UIImageView(frame: CGRect(x: 30, y: 30, width: 50, height: 50))
        userPortrait.backgroundColor = UIColor.lightGray
        userPortrait.image = UIImage(named: "头像")
        //设置遮罩
        userPortrait.layer.masksToBounds = true
        userPortrait.layer.cornerRadius = userPortrait.frame.width/2
        //为头像添加手势
        userPortrait.isUserInteractionEnabled = true
        let addPhotoGuesture = UITapGestureRecognizer(target: self, action: #selector(UserViewController.openUserInfoViewController))
        userPortrait.addGestureRecognizer(addPhotoGuesture)
        cardView.addSubview(userPortrait)

        //登陆信息
        let loginInfo = UILabel(frame: CGRect(x: 100, y: 40, width: 100, height: 30))
        loginInfo.text = "未登录"
        loginInfo.font = UIFont.systemFont(ofSize: 15)
        cardView.addSubview(loginInfo)
        self.view.bringSubviewToFront(cardView)
        

//        let view = UIView(frame: CGRect(x: 0, y: 200, width: screenRect.width, height: 300))
//        view.backgroundColor = UIColor.white
//        self.view.addSubview(view)
        
        //功能表单
        let otherFunTableView = UITableView(frame: CGRect(x: 0, y: 150, width: screenRect.width, height: 600), style: .grouped)
        self.view.addSubview(otherFunTableView)
        otherFunTableView.dataSource = self
        otherFunTableView.delegate = self
        otherFunTableView.isScrollEnabled = false
//        otherFunTableView.snp.makeConstraints { (make) in
//            make.top.equalTo(cardView.snp.bottom).offset(-50)
//        }
        
        self.view.bringSubviewToFront(cardView)



        
    }
    
    @objc func openUserInfoViewController() {

        let loginViewController = LoginViewController()
        self.present(loginViewController, animated: true, completion: nil)
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return otherFunNameDict.count
        } else {
            return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 200, width: self.view.bounds.width, height: 200))
        view.backgroundColor = UIColor.white
        return view
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifer = "reusedCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifer)
            cell?.textLabel?.text = otherFunNameDict[(indexPath as NSIndexPath).row]
        }
        
        cell?.accessoryType = .disclosureIndicator
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let feedbackViewController = FeedbackViewController()
            self.present(feedbackViewController, animated: true, completion: nil)
        }
        
        if indexPath.row == 2 {
            let settingsViewController = SettingsViewController()
            self.present(settingsViewController, animated: true, completion: nil)
        }
    }
    

    

    

}


