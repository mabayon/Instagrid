//
//  PicturesView.swift
//  Instagrid
//
//  Created by Mahieu Bayon on 28/08/2019.
//  Copyright © 2019 Mabayon. All rights reserved.
//

import UIKit

class PicturesView: UIView {

    @IBOutlet private var pictureTwo: UIButton!
    @IBOutlet private var pictureFour: UIButton!
    @IBOutlet private var layoutOne: UIButton!
    @IBOutlet private var layoutTwo: UIButton!
    @IBOutlet private var layoutThree: UIButton!
    
    enum Style {
        case first, second, third
    }
    
    // init var style
    var style: Style = .second {
        didSet {
            // Change style only if the value change
            if self.style != oldValue {
                setStyle(style)
            }
        }
    }
    
    // Hide button according to the style
    private func setStyle(_ style: Style) {
        switch style {
            
        case .first:
            // Select the first layout and deselect the others
            layoutOne.isSelected = true
            layoutTwo.isSelected = false
            layoutThree.isSelected = false
            
            pictureTwo.isHidden = true
            pictureFour.isHidden = false
            
        case .second:
            // Select the second layout and deselect the others
            layoutOne.isSelected = false
            layoutTwo.isSelected = true
            layoutThree.isSelected = false

            pictureTwo.isHidden = false
            pictureFour.isHidden = true

        case .third:
            // Select the third layout and deselect the others
            layoutOne.isSelected = false
            layoutTwo.isSelected = false
            layoutThree.isSelected = true

            pictureTwo.isHidden = false
            pictureFour.isHidden = false
        }
    }
}
