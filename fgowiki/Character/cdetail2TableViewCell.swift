//
//  cdetail2TableViewCell.swift
//  fgowiki
//
//  Created by GaoYy on 2018/12/4.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class cdetail2TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cdname: UILabel!
    @IBOutlet weak var cdtext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
