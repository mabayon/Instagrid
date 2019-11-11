//
//  LayoutButton.swift
//  Instagrid
//
//  Created by Mahieu Bayon on 28/08/2019.
//  Copyright © 2019 Mabayon. All rights reserved.
//

import UIKit

class LayoutButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            // If the button is selected set image with image named Selected
            if isSelected {
                self.setImage(UIImage(named: "Selected"), for: .normal)
                // else no image
            } else {
                self.setImage(nil, for: .normal)
            }
        }
    }

}
