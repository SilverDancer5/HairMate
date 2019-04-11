//
//  ChangeHairViewController.swift
//  HairMate
//
//  Created by 1320-hym on 2019/3/12.
//  Copyright © 2019年 1317-hym. All rights reserved.
//

import UIKit
import Vision

class FaceShapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    var imagePickerController: UIImagePickerController!
    var resultImageView: UIImageView!
    var resultLabel: UILabel!
    var resultImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        
        let screenRect = UIScreen.main.bounds
        
        
        //设置关闭页面按钮
        let closeBtn = UIButton(frame: CGRect(x:0, y: 30, width: 50, height: 20))
        self.view.addSubview(closeBtn)
        closeBtn.setTitle("关闭", for: .normal)
        closeBtn.setTitleColor(UIColor.black, for: .normal)
        closeBtn.addTarget(self, action: #selector(FaceShapViewController.dismissSelf), for: UIControl.Event.touchUpInside)
        
        
        //为照片视图添加手势
        resultImageView = UIImageView(frame: CGRect(x: 0, y: 60, width: screenRect.size.width, height: screenRect.size.height - 200))
        resultImageView.backgroundColor = UIColor.lightGray
        
        resultImageView.isUserInteractionEnabled = true
        self.view.addSubview(resultImageView)
        
        let addPhotoGuesture = UITapGestureRecognizer(target: self, action: #selector(FaceShapViewController.addPhotoFromLibrary))
        
        resultImageView.addGestureRecognizer(addPhotoGuesture)
        
        
        resultLabel = UILabel(frame: CGRect(x: 150, y: 550, width: 200, height: 40))
        resultLabel.text = "没有图片"
        self.view.addSubview(resultLabel)
        
        let faceshapLabel = UILabel()
        self.view.addSubview(faceshapLabel)
        faceshapLabel.text = "你的脸型：国字脸（仅供参考）"
        faceshapLabel.snp.makeConstraints { (make) in
            make.width.equalTo(screenRect.width)
            make.height.equalTo(40)
            make.top.equalTo(resultLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        
    }
    
    
    
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
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true, completion: nil)
        
        guard let image = (info[UIImagePickerController.InfoKey.editedImage] as? UIImage) else {
            fatalError("no image")
        }
        
        self.resultImage = image
        DispatchQueue.main.async {
            self.resultImageView.image = self.resultImage
        }
        
        self.processImage(image: self.resultImage)
        
        
    }
    
    //关闭图片选择
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //关闭本页面
    @objc func dismissSelf() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 识别图片
    func processImage(image:UIImage) {
        self.resultLabel.text = "相片处理中..."
        let handler = VNImageRequestHandler.init(cgImage: image.cgImage!)
        
        // 面部轮廓
//      let request = VNDetectFaceRectanglesRequest.init(completionHandler: handleFaceDetect)
        
        // 面部特征
        let request = VNDetectFaceLandmarksRequest.init(completionHandler: handleFaceDetect)
        try? handler.perform([request])
    }
    
    
    // 处理结果
    func handleFaceDetect(request:VNRequest,error:Error?) {
        guard let obversations = request.results as? [VNFaceObservation] else {
            fatalError("no face")
        }
        self.resultLabel.text = "识别出\(obversations.count)张脸"
        
        for subView in self.resultImageView.subviews where subView.tag == 100 {
            subView.removeFromSuperview()
        }
        
        var landmarkRegions : [VNFaceLandmarkRegion2D] = []
        
        for faceObversion in obversations {
            // 面部轮廓
            //            self.showFaceContour(faceObversion: faceObversion, toView: self.btnImageView)
            
            // 面部特征
            landmarkRegions += self.showFaceFeature(faceObversion: faceObversion, toView: self.resultImageView)
            resultImage =  self.drawOnImage(source: self.resultImage,
                                            boundingRect: faceObversion.boundingBox,
                                            faceLandmarkRegions: landmarkRegions)
        }
        self.resultImageView.image = resultImage
    }
    
    // 显示面部轮廓
    func showFaceContour(faceObversion face : VNFaceObservation, toView view : UIView) {
        // boundingBox是CGRect类型，但是boundingBox返回的是x,y,w,h的比例(value:0~1)，需要进行转换
        let boundingBox = face.boundingBox
        let imageBoundingBox = view.bounds
        
        let w = boundingBox.size.width * imageBoundingBox.width
        let h = boundingBox.size.height * imageBoundingBox.height
        
        let x = boundingBox.origin.x * imageBoundingBox.width
        let y = imageBoundingBox.height - boundingBox.origin.y * imageBoundingBox.height - h
        
        let subview = UIView(frame: CGRect(x: x, y: y, width: w, height: h))
        subview.layer.borderColor = UIColor.green.cgColor
        subview.layer.borderWidth = 1
        subview.layer.cornerRadius = 1
        subview.tag = 100
        view.addSubview(subview)
    }
    
    // 返回面部特征
    func showFaceFeature(faceObversion face: VNFaceObservation, toView view: UIView) ->[VNFaceLandmarkRegion2D] {
        guard let landmarks = face.landmarks else { return [] }
        var landmarkRegions: [VNFaceLandmarkRegion2D] = []
        
        // 脸部轮廓
        if let faceContour = landmarks.faceContour {
                    landmarkRegions.append(faceContour)
        }
        
        //左眼轮廓
        if let leftEye = landmarks.leftEye {
            landmarkRegions.append(leftEye)
        }
        
        //右眼轮廓
        if let rightEye = landmarks.rightEye {
            landmarkRegions.append(rightEye)
        }
        
        //鼻子轮廓
        if let nose = landmarks.nose {
            landmarkRegions.append(nose)
        }
        
        return landmarkRegions
    }

}

extension FaceShapViewController {
    func drawOnImage(source: UIImage,
                     boundingRect: CGRect,
                     faceLandmarkRegions: [VNFaceLandmarkRegion2D]) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(source.size, false, 1)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: source.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(CGBlendMode.colorBurn)
        context.setLineJoin(.round)
        context.setLineCap(.round)
        context.setShouldAntialias(true)
        context.setAllowsAntialiasing(true)
        context.setLineWidth(5.0)
        context.setStrokeColor(UIColor.black.cgColor)
        
        // 原始图片
        let rect = CGRect(x: 0, y:0, width: source.size.width, height: source.size.height)
        context.draw(source.cgImage!, in: rect)
        
        // 绘制轮廓
        let rectWidth = source.size.width * boundingRect.size.width
        let rectHeight = source.size.height * boundingRect.size.height
        context.addRect(CGRect(x: boundingRect.origin.x * source.size.width, y:boundingRect.origin.y * source.size.height, width: rectWidth, height: rectHeight))
        context.drawPath(using: CGPathDrawingMode.stroke)
        
        // 绘制面部特征
        context.setStrokeColor(UIColor.red.cgColor)
        for faceLandmarkRegion in faceLandmarkRegions {
            var points: [CGPoint] = []
            for i in 0..<faceLandmarkRegion.pointCount {
                let point = faceLandmarkRegion.normalizedPoints[i]
                let p = CGPoint(x: CGFloat(point.x), y: CGFloat(point.y))
                points.append(p)
            }
            let mappedPoints = points.map { CGPoint(x: boundingRect.origin.x * source.size.width + $0.x * rectWidth, y: boundingRect.origin.y * source.size.height + $0.y * rectHeight) }
            context.addLines(between: mappedPoints)
            context.drawPath(using: CGPathDrawingMode.stroke)
        }
        
        let coloredImg : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return coloredImg
    }
}

