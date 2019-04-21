//
//  CameraViewController.swift
//  PDFify
//
//  Created by MKHS on 4/14/19.
//  Copyright © 2019 mkhs. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
<<<<<<< HEAD

=======
    
>>>>>>> temp
    var PDFs: [UIImage] = []
    
    @IBOutlet weak var photoPreview: UIImageView!
    
<<<<<<< HEAD
   
    @IBOutlet weak var collectionView: UICollectionView!
    
=======
    
    @IBOutlet weak var collectionView: UICollectionView!
>>>>>>> temp
    
    
    var session: AVCaptureSession?
    var stillImageOutput: AVCapturePhotoOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    let outerShapeLayer = CAShapeLayer()
    let innerShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
<<<<<<< HEAD
=======
        
        
>>>>>>> temp
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSession.Preset.photo
        let backCamera =  AVCaptureDevice.default(for: AVMediaType.video)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }
        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            stillImageOutput = AVCapturePhotoOutput()
            //stillImageOutput?.outputSettings = [AVVideoCodecKey:  AVVideoCodecType.jpeg]
            if session!.canAddOutput(stillImageOutput!) {
                session!.addOutput(stillImageOutput!)
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
                videoPreviewLayer!.videoGravity =    AVLayerVideoGravity.resizeAspect
                videoPreviewLayer!.connection?.videoOrientation =   AVCaptureVideoOrientation.portrait
                photoPreview.layer.addSublayer(videoPreviewLayer!)
                session!.startRunning()
            }
        }
        
        drawCaptureButton()
        
    }
    
<<<<<<< HEAD

        // Do any additional setup after loading the view.
=======
    
    // Do any additional setup after loading the view.
>>>>>>> temp
    
    // make preview layer fit camera view
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        videoPreviewLayer!.frame = photoPreview.bounds
    }
    
    // collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PDFCell", for: indexPath)
        return cell
    }
    
    
    
    
    // collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PDFs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PDFCell", for: indexPath)
        return cell
    }
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    
    func drawCaptureButton() {
        
        // outer circle
        let outerCirclePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2,y: photoPreview.frame.height * 0.95), radius: CGFloat(30), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        //let outerShapeLayer = CAShapeLayer()
        outerShapeLayer.path = outerCirclePath.cgPath
        
        //change the fill color
        outerShapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        outerShapeLayer.strokeColor = UIColor(white: 1, alpha: 0.5).cgColor
        //you can change the line width
        outerShapeLayer.lineWidth = 5.0
        
        view.layer.addSublayer(outerShapeLayer)
        
        // inner circle
        let innerCirclePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2,y: photoPreview.frame.height * 0.95), radius: CGFloat(23), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        //innerShapeLayer = CAShapeLayer()
        innerShapeLayer.path = innerCirclePath.cgPath
        
        //change the fill color
        innerShapeLayer.fillColor = UIColor(white: 1, alpha: 0.5).cgColor
        //you can change the stroke color
        innerShapeLayer.strokeColor = UIColor.white.cgColor
        //you can change the line width
        innerShapeLayer.lineWidth = 3.0
        
        view.layer.addSublayer(innerShapeLayer)
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // capture circle path
        let captureCirclePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.width / 2,y: photoPreview.frame.height * 0.95), radius: CGFloat(21), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.toValue = captureCirclePath.cgPath
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pathAnimation.duration = 0.10
        pathAnimation.autoreverses = true
        
        // manage touch
        let touch = touches.first
        let point = touch!.location(in: self.view)
        if outerShapeLayer.path!.contains(point) {
            // animate capture button
            innerShapeLayer.add(pathAnimation, forKey: "pathAnimation")
            
            // capture settings
            let settings = AVCapturePhotoSettings()
            let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
            let previewFormat = [
                kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                kCVPixelBufferWidthKey as String: 170,
                kCVPixelBufferHeightKey as String: 257
            ]
            settings.previewPhotoFormat = previewFormat
            // capture photo
            stillImageOutput?.capturePhoto(with: settings, delegate: self)
            
        }
    }
    
}

// save photo to PDFs array
extension CameraViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("error occurred : \(error.localizedDescription)")
        }
        
        if let dataImage = photo.fileDataRepresentation() {
            print(UIImage(data: dataImage)?.size as Any)
            
            let dataProvider = CGDataProvider(data: dataImage as CFData)
            let cgImageRef: CGImage! = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: .defaultIntent)
            let image = UIImage(cgImage: cgImageRef, scale: 1.0, orientation: UIImage.Orientation.up)
            
            // save image to thumbnail array
            self.PDFs.append(image)
            print(PDFs)
            collectionView.reloadData()
        } else {
            print("some error here")
        }
    }
}

