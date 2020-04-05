//
//  RequestCell.swift
//  UklonTest
//
//  Created by Anton Stremovskiy on 17.03.2020.
//  Copyright © 2020 Anton Stremovskiy. All rights reserved.
//

import UIKit

class RequestCell: UITableViewCell {
    
    @IBOutlet weak var requestName: UILabel!
    @IBOutlet weak var checkmark: UIImageView!
    @IBOutlet weak var noteContainerHeight: NSLayoutConstraint!
    
    func setupCellView(_ item: PersonalRequest, _ isItemSelected: Bool) {
        
        requestName.text = item.localizableName.localized
        checkmark.isHidden = !isItemSelected
        
        UIView.animate(withDuration: 0.5) {
            self.noteContainerHeight.constant = item.isEditable && isItemSelected ? 44 : 0
            self.layoutIfNeeded()
        }
    }
}
