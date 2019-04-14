//
//  ViewController.swift
//  NewCoreData
//
//  Created by Anh vũ on 4/11/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class ToolViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var toolName: UITextField!
    @IBOutlet weak var toolAge: UITextField!
    @IBOutlet weak var logo: UIImageView!
    var indexPath: IndexPath?
    var users: Entity?
    var image:UIImage? {
        didSet {
            logo?.image = UIImage(data: (image?.pngData())!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if users != nil, let logos = users?.image {
            toolName.text = users?.name
            toolAge.text = users?.age
            logo.image = UIImage(cgImage: logos.cgImage!)
        }
    }

    @IBAction func save(_ sender: UIButton) {
        if indexPath != nil {
            users?.name = toolName.text
            users?.age = toolAge.text
            users?.image = UIImage(cgImage: logo.image!.cgImage!)
            
        } else {
            let userInfor = Entity(context: AppDelegate.context)
            userInfor.name = toolName.text
            userInfor.age = toolAge.text
            userInfor.image = logo.image
            
        }
        AppDelegate.saveContext()
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func tap(_ sender: Any) {
        let imagepickerControllerDeleget = UIImagePickerController()
        imagepickerControllerDeleget.sourceType = .photoLibrary
        imagepickerControllerDeleget.delegate = self
        present(imagepickerControllerDeleget, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

