//
//  CharacterTableViewCell.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var cclass: UILabel!
    @IBOutlet weak var cimage: UIImageView!
    @IBOutlet weak var cname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
