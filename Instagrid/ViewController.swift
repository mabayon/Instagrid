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
    private var swipeGesture: UISwipeGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for button in pictureButtons {
            // Set content mode to AspectFill
            button.imageView?.contentMode = .scaleAspectFill
        }
        
        // init gesture recognizer
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(dragActivityController))
        
        if let swipeGesture = swipeGesture {
            // Check the orientation of the device
            if UIApplication.shared.statusBarOrientation.isLandscape {
                // If landscape swipe left
                self.swipeGesture?.direction = .left
            } else {
                // Else swipe up
                self.swipeGesture?.direction = .up
            }
            // Init numberOfTouchesRequired to 1
            swipeGesture.numberOfTouchesRequired = 1
            // Add the gestureRecognizer to the view
            view.addGestureRecognizer(swipeGesture)
        }
    }
    
    @IBAction func didTapLayout(_ sender: Any) {
        
        // If the sender is not a layoutButton return
        guard let button = sender as? LayoutButton else  {
            return
        }
        
        switch button.tag {
        case 1:
            // Change style: first layout
            picturesView.style = .first
            
        case 2:
            // Change style: second layout
            picturesView.style = .second
            
        case 3:
            // Change style: third layout
            picturesView.style = .third
            
        default:
            break
        }
    }
    
    @objc func dragActivityController() {
        // Init image with a screenshot of picturesView
        let image = takeScreenShot(of: picturesView)
        // Init items array with image
        let items = [image]
        // Create an activityViewController
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        // Display it
        present(activityController, animated: true)
    }
    // When the orientation change
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { _ in
            // Check the orientation of the device
            if UIApplication.shared.statusBarOrientation.isLandscape {
                // If landscape swipe left
                self.swipeGesture?.direction = .left
            } else {
                // Else swipe up
                self.swipeGesture?.direction = .up
            }
        })
    }
    
    private func takeScreenShot(of view: UIView) -> UIImage {
        // Init render with a UIGraphicsImageRenderer of view size
        let render = UIGraphicsImageRenderer(size: view.bounds.size)
        // Init image with a screenshot of the view
        let image = render.image(actions: { _ in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        })
        return image
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
   
    @IBAction func didTapPictureButtons(_ sender: Any) {
        // If the sender is not a UIButton return
        guard let button = sender as? UIButton else  {
            return
        }
        // Saved button tapped for change the image later
        buttonTapped = button
        // Init an imagePickerController
        let imagePicker = UIImagePickerController()
        
        // Init delegate to self
        imagePicker.delegate = self
        // Allow only photo from photoLibrary
        imagePicker.sourceType = .photoLibrary

        // Present the imagePickerController
        present(imagePicker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Set the image of the button tapped with the image selected
            buttonTapped?.setImage(image, for: .normal)
        }
        // Dismiss when cancel or finish picking image
        dismiss(animated: true, completion: nil)
    }


}
