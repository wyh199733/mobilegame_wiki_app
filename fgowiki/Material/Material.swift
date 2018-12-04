//
//  Equip.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import Foundation
import UIKit
class Material {
    //MARK: Properties
    var Name: String
    var Image: UIImage?
    var Place: String
    var Class:String
    var About:String
    //MARK: Initialization
    init?(Name: String, Image: UIImage?, Place: String,Class:String,About:String) {
        // Initialization should fail if there is no name or if the rating is negative.
        if Name.isEmpty {
            return nil
        }
        // Initialize stored properties.
        self.Name = Name
        self.Image = Image
        self.Place = Place
        self.Class=Class
        self.About=About
    }
}

