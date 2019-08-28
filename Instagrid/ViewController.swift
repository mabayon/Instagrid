//
//  ViewController.swift
//  Instagrid
//
//  Created by Mahieu Bayon on 26/08/2019.
//  Copyright © 2019 Mabayon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var layoutButtons: [LayoutButton]!
    @IBOutlet weak var picturesView: PicturesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapLayout(_ sender: Any) {
        
        // If the sender is not a layoutButton return
        guard let button = sender as? LayoutButton else  {
            return
        }
        
        switch button.tag {
        case 1:

            // If the button tapped is not selected
            if layoutButtons[1].isSelected || layoutButtons[2].isSelected {
                // Select the button
                button.isSelected = true
                // Deselect the others
                layoutButtons[1].isSelected = false
                layoutButtons[2].isSelected = false
                picturesView.style = .first
            }
        case 2:
            
            if layoutButtons[0].isSelected || layoutButtons[2].isSelected {
                button.isSelected = true
                layoutButtons[0].isSelected = false
                layoutButtons[2].isSelected = false
                picturesView.style = .second
            }
            
        case 3:
            
            if layoutButtons[0].isSelected || layoutButtons[1].isSelected {
                button.isSelected = true
                
                layoutButtons[0].isSelected = false
                layoutButtons[1].isSelected = false
                picturesView.style = .third
            }
        default:
            break
        }

    }
    
}

