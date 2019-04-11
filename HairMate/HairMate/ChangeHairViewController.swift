//
//  ChangeHairViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/12.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit

class ChangeHairViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    private var _selectedStickerView:StickerView?
    var selectedStickerView:StickerView? {
        get {
            return _selectedStickerView
        }
        set {
            
            // if other sticker choosed then resign the handler
            if _selectedStickerView != newValue {
                if let selectedStickerView = _selectedStickerView {
                    selectedStickerView.showEditingHandlers = false
                }
                _selectedStickerView = newValue
            }
            
            // assign handler to new sticker added
            if let selectedStickerView = _selectedStickerView {
                selectedStickerView.showEditingHandlers = true
                selectedStickerView.superview?.bringSubviewToFront(selectedStickerView)
            }
        }
    }
    
    var images = ["hair1", "hair2", "hair3", "hair4", "hair5", "hair6"]
    var imagePickerController: UIImagePickerController!
    var photoImageView: UIImageView!
    var num = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置tab
        self.view.backgroundColor = UIColor.white
        self.title = "主页"
        self.tabBarItem.image = UIImage(named: "main")
        
        let screenRect = UIScreen.main.bounds
        
        
        //设置关闭页面按钮
        let closeBtn = UIButton(frame: CGRect(x:10, y: 50, width: 50, height: 20))
        self.view.addSubview(closeBtn)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.backgroundColor = UIColor(red: 65/255, green: 105/255, blue: 225/255, alpha: 1.0)
        closeBtn.layer.cornerRadius = 4
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(ChangeHairViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        closeBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
        }
        
        
        //设置照片子视图
        photoImageView = UIImageView(frame: CGRect(x: 0, y: 70, width: screenRect.size.width, height: screenRect.size.height - 210))
        photoImageView.image = UIImage(named: "addImg")
//        photoImageView.backgroundColor = UIColor.lightGray
//        photoImageView.image.contentMode = UIView.ContentMode.center
        photoImageView.clipsToBounds  = true

        photoImageView.isUserInteractionEnabled = true
        self.view.addSubview(photoImageView)
        let addPhotoGuesture = UITapGestureRecognizer(target: self, action: #selector(ChangeHairViewController.showAlert))
        photoImageView.addGestureRecognizer(addPhotoGuesture)
        
        //设置发型选择子视图
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 155, height: 135)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        let rect = CGRect(x: 0, y: screenRect.size.height - 130, width: screenRect.size.width, height: 140)
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reusedCell")
        collectionView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
//        collectionView.backgroundColor = UIColor.white
        collectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowOpacity = 0.9
        collectionView.layer.shadowRadius = 4
        collectionView.layer.masksToBounds = false
        self.view.addSubview(collectionView)
        
        
        
    }
    
    //贴纸功能实现
    func creatHairImage(number: Int) {
        if number >= 0 {
            let testImage = UIImageView.init(frame: CGRect.init(x: 200, y: 70, width: 200, height: 200))
            testImage.image = UIImage(named: images[number])
            
            let stickerView3 = StickerView.init(contentView: testImage)
            stickerView3.center = CGPoint.init(x: 150, y: 150)
            stickerView3.delegate = self
            stickerView3.setImage(UIImage.init(named: "Close")!, forHandler: StickerViewHandler.close)
            stickerView3.setImage(UIImage.init(named: "Rotate")!, forHandler: StickerViewHandler.rotate)
            stickerView3.setImage(UIImage.init(named: "Flip")!, forHandler: StickerViewHandler.flip)
            stickerView3.showEditingHandlers = false
            self.view.addSubview(stickerView3)
            
            // first off assign handler to stickerView
            self.selectedStickerView = stickerView3
            //    }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "reusedCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        let imageView: UIImageView? = cell.viewWithTag(1)as?UIImageView
        if imageView == nil {
            let image = UIImage(named: images[(indexPath as NSIndexPath).row])
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 120)
            imageView.layer.opacity = 0.5
            imageView.tag = 1
            cell.addSubview(imageView)
        } else {
            imageView?.image = UIImage(named: images[(indexPath as NSIndexPath).row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let imageView = cell?.viewWithTag(1)
        imageView?.layer.opacity = 1.0
        num = (indexPath as NSIndexPath).row
        creatHairImage(number: num)
    }
    
    @objc func showAlert() {
        let actionSheet = UIAlertController(title: "Information", message: "选择照片来源", preferredStyle: UIAlertController.Style.actionSheet)
        
        let chooseFromLibrary = UIAlertAction(title: "从手机选择", style: UIAlertAction.Style.default, handler: {(alerts:UIAlertAction) -> Void in
            self.addPhotoFromLibrary()
        })
        
        let chooseFromCamera = UIAlertAction(title: "拍照", style: UIAlertAction.Style.default, handler: {(alerts:UIAlertAction) -> Void in
            self.addPhotoFromCamera()
        })
        
        
        let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel)
        
        actionSheet.addAction(chooseFromLibrary)
        actionSheet.addAction(chooseFromCamera)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet,animated: true, completion: nil)
    }
    
    // MARK: 调用图库
    @objc func addPhotoFromLibrary() {
        self.imagePickerController = UIImagePickerController()
        self.imagePickerController.delegate = self
        self.imagePickerController.allowsEditing = true
        self.imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.imagePickerController.navigationBar.barTintColor = UIColor.orange
        self.imagePickerController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.imagePickerController.navigationBar.tintColor = UIColor.white
        self.present(self.imagePickerController, animated: true, completion: nil)
        
    }
    
    //MARK: 调用相机
    @objc func addPhotoFromCamera() {
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            self.imagePickerController = UIImagePickerController()
            self.imagePickerController.sourceType = UIImagePickerController.SourceType.camera
            self.imagePickerController.cameraDevice = UIImagePickerController.CameraDevice.rear
            self.imagePickerController.showsCameraControls = true
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.imagePickerController.navigationBar.barTintColor = UIColor.orange
            self.imagePickerController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            self.imagePickerController.navigationBar.tintColor = UIColor.white
            self.present(self.imagePickerController, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.photoImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
   

}

extension ChangeHairViewController {
    @IBAction func tap(_ sender:UITapGestureRecognizer) {
        self.selectedStickerView?.showEditingHandlers = false
    }
}

// MARK: StickerViewDelegate
extension ChangeHairViewController: StickerViewDelegate {
    func stickerViewDidBeginMoving(_ stickerView: StickerView) {
        self.selectedStickerView = stickerView
    }
    
    func stickerViewDidChangeMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndMoving(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidBeginRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidChangeRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidEndRotating(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidClose(_ stickerView: StickerView) {
        
    }
    
    func stickerViewDidTap(_ stickerView: StickerView) {
        self.selectedStickerView = stickerView
    }
}



