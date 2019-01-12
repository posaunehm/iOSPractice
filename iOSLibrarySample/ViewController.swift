//
//  ViewController.swift
//  iOSLibrarySample
//
//  Created by Maekawa Hiroshi on 2019/01/12.
//  Copyright © 2019年 Maekawa Hiroshi. All rights reserved.
//

import UIKit
import Fusuma

class ViewController: UIViewController, FusumaDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func openCamera(_ sender: Any) {
    let fusuma = FusumaViewController()
    fusuma.delegate = self
    fusuma.availableModes = [FusumaMode.library, FusumaMode.camera, FusumaMode.video] // Add .video capturing mode to the default .library and .camera modes
    fusuma.cropHeightRatio = 0.6 // Height-to-width ratio. The default value is 1, which means a squared-size photo.
    fusuma.allowMultipleSelection = true // You can select multiple photos from the camera roll. The default value is false.
    self.present(fusuma, animated: true, completion: nil)
  }

  // Return the image which is selected from camera roll or is taken via the camera.
  func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {

    print("Image selected")
  }

// Return the image but called after is dismissed.
  func fusumaDismissedWithImage(image: UIImage, source: FusumaMode) {

    print("Called just after FusumaViewController is dismissed.")
  }

  func fusumaVideoCompleted(withFileURL fileURL: URL) {

    print("Called just after a video has been selected.")
  }

// When camera roll is not authorized, this method is called.
  func fusumaCameraRollUnauthorized() {

    print("Camera roll unauthorized")
  }

// Return selected images when you allow to select multiple photos.
  func fusumaMultipleImageSelected(_ images: [UIImage], source: FusumaMode) {

  }

// Return an image and the detailed information.
  func fusumaImageSelected(_ image: UIImage, source: FusumaMode, metaData: ImageMetadata) {

  }
  
}

