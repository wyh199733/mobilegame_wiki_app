//
//  EquipTableViewCell.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var mplace: UILabel!
    @IBOutlet weak var mname: UILabel!
    @IBOutlet weak var mimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

