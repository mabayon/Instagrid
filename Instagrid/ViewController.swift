//
//  ViewController.swift
//  Instagrid
//
//  Created by Mahieu Bayon on 26/08/2019.
//  Copyright © 2019 Mabayon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pictureButtons: [UIButton]!
    @IBOutlet var layoutButtons: [LayoutButton]!
    @IBOutlet weak var picturesView: PicturesView!
    
    private var buttonTapped: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in pictureButtons {
            button.imageView?.contentMode = .scaleAspectFill
        }
    }
    
    @IBAction func didTapLayout(_ sender: Any) {
        
        // If the sender is not a layoutButton return
        guard let button = sender as? LayoutButton else  {
            return
        }
        
        switch button.tag {
        case 1:
            picturesView.style = .first
            
        case 2:
            picturesView.style = .second
            
        case 3:
            picturesView.style = .third
            
        default:
            break
        }

    }
    
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    @IBAction func didTapPictureButtons(_ sender: Any) {
        // If the sender is not a UIButton return
        guard let button = sender as? UIButton else  {
            return
        }
        
        buttonTapped = button
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        present(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            buttonTapped?.setImage(image, for: .normal)
        }
        self.dismiss(animated: true, completion: nil)
    }


}
