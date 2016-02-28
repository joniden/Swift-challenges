//
//  ViewController.swift
//  Challenge 7: Upload picture
//
//  Created by Joacim Nidén on 28/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

//Load the necessary controllers
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        
    }

    //The button upload button
    @IBAction func uploadImageBtn(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .PhotoLibrary
        
        //Adds the modal that opens the library
        presentViewController(picker, animated: true, completion: nil)
    }
    
    //Variable for pickercontroller
    let picker = UIImagePickerController()
    
    //Imageview
    @IBOutlet weak var imageView: UIImageView!
    
    //Handler
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo editingInfo: [String : AnyObject]) {
        
        //Put the image in a variable
        let chosenImage = editingInfo[UIImagePickerControllerOriginalImage]
        
        //How the image will be displayed if it doesn't fit
        imageView.contentMode = .ScaleAspectFit
        imageView.image = chosenImage! as? UIImage //The actual image
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //When cancelling
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    
    }
}

