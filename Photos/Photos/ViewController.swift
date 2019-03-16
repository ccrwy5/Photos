//
//  ViewController.swift
//  Photos
//
//  Created by Chris Rehagen on 3/15/19.
//  Copyright © 2019 Chris Rehagen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self    }

    @IBAction func takePicButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Camera Error", message: "Xcode doesn't have a camera to use, must use actual iPhone :(", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: nil))
            
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func organizeButton(_ sender: Any) {
        imagePickerController.allowsEditing = false
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagefromLibrary = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = imagefromLibrary
        }
        dismiss(animated: true, completion: nil)
    }
    
}


