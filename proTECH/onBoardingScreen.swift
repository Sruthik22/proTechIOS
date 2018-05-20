//
//  onBoardingScreen.swift
//  proTECH
//
//  Created by Sruthi Kurada on 5/20/18.
//  Copyright © 2018 skurada. All rights reserved.
//

import UIKit

class onBoardingScreen: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        if self.imageView.image == nil {
            
            var data = UserDefaults.standard.object(forKey: "savedFloorPlan")
            
            if data != nil {
                data = data as! NSData
                imageView.image = UIImage(data: data as! Data)
            }
                
            else {
                let yourImage: UIImage = UIImage(named: "placeholder")!
                imageView.image = yourImage
            }
        }
    }
    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func loadImageButtonTapped(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        else {
            //Error
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        let imageOfFloorPlan = imageView.image
        
        //Lets save this image
        let imageData: NSData = UIImagePNGRepresentation(imageOfFloorPlan!)! as NSData
        UserDefaults.standard.set(imageData, forKey: "savedFloorPlan")
        
        UserDefaults.standard.set("uploaded", forKey: "name")
    }
    
    
}

