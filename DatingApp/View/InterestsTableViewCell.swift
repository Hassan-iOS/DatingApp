//
//  InterestsTableViewCell.swift
//  DatingApp
//
//  Created by Hassan on 22/11/2019.
//  Copyright © 2019 Hassan. All rights reserved.
//

import UIKit

class InterestsTableViewCell: UITableViewCell {

    @IBOutlet weak var womenView: UIView!
    @IBOutlet weak var manView: UIView!
    @IBOutlet weak var ageView: UIView!
    
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpViewInCell(views: [womenView, manView, ageView])
    }
    func setUpViewInCell(views: [UIView]) {
        containerView.setupView()
        containerView.layer.cornerRadius = 20
        containerView.layer.borderColor = UIColor.clear.cgColor
        for view in views {
            view.setupView()
        }
        views[0].layer.borderColor = UIColor.blue.cgColor
        views[1].layer.borderColor = UIColor.red.cgColor
        views[2].layer.borderColor = UIColor.green.cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
