//
//  Character.swift
//  fgowiki1
//
//  Created by mio on 2018/12/1.
//  Copyright © 2018年 mio. All rights reserved.
//

import Foundation
import UIKit
class Character {
    //MARK: Properties
    var Name: String
    var Image: UIImage?
    var Class: String
    //MARK: Initialization
    init?(Name: String, Image: UIImage?, Class: String) {
        // Initialization should fail if there is no name or if the rating is negative.
        if Name.isEmpty {
            return nil
        }
        // Initialize stored properties.
        self.Name = Name
        self.Image = Image
        self.Class = Class
    }
}


