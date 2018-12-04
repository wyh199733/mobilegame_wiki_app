//
//  Equip.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import Foundation
import UIKit
class Equip {
    //MARK: Properties
    //MARK: Properties
    var Name: String
    var Image: UIImage?
    var Skillmax: String
    var Star:String
    var Lv1hp:String
    var Lv1atk:String
    var Lvmaxhp:String
    var Lvmaxatk:String
    var Cost:String
    var Illust:String
    var Intro:String
    //MARK: Initialization
    init?(Name: String, Image: UIImage?, Skillmax: String,Star:String,Lv1hp:String,Lv1atk:String,Lvmaxhp:String,Lvmaxatk:String,Cost:String,Illust:String,Intro:String) {
        // Initialization should fail if there is no name or if the rating is negative.
        if Name.isEmpty {
            return nil
        }
        // Initialize stored properties.
        self.Name = Name
        self.Image = Image
        self.Skillmax = Skillmax
        self.Star=Star
        self.Lv1hp=Lv1hp
        self.Lv1atk=Lv1atk
        self.Lvmaxhp=Lvmaxhp
        self.Lvmaxatk=Lvmaxatk
        self.Cost=Cost
        self.Illust=Illust
        self.Intro=Intro
        
    }
}
