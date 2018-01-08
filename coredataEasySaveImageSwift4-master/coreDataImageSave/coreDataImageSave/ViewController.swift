//
//  ViewController.swift
//  coreDataImageSave
//
//  Created by Bibin Mathew on 1/8/18.
//  Copyright © 2018 featherSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var browseImageView: UIImageView!
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var aboutMeText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        browseImageView.contentMode = .scaleAspectFit
        browseImageView.image = chosenImage
        dismiss(animated:true, completion: nil)
    }
    @IBAction func savetoDB(_ sender: Any) {
        guard let personImage = browseImageView?.image else {
            return
        }
        let imageData = UIImagePNGRepresentation(browseImageView.image!)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newEntry = BrowseImage(context: context)
        newEntry.image = imageData
        newEntry.firstName = firstName.text
        newEntry.aboutMe = aboutMeText.text
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        dismiss(animated: true, completion: nil)
    }
}

