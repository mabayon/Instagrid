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
    
    enum Style {
        case first, second, third
    }
    
    // init var style
    var style: Style = .second {
        didSet {
            setStyle(style)
        }
    }
    
    // Hide button according to the style
    private func setStyle(_ style: Style) {
        switch style {
            
        case .first:
            pictureTwo.isHidden = true
            pictureFour.isHidden = false
            
        case .second:
            pictureTwo.isHidden = false
            pictureFour.isHidden = true

        case .third:
            pictureTwo.isHidden = false
            pictureFour.isHidden = false
        }
    }
}
