//
//  AboutHerTableViewCell.swift
//  DatingApp
//
//  Created by Hassan on 22/11/2019.
//  Copyright © 2019 Hassan. All rights reserved.
//

import UIKit

class AboutHerTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.clear.cgColor
        containerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}
