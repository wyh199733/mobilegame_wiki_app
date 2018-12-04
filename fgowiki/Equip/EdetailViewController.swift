//
//  EdetailViewController.swift
//  fgowiki
//
//  Created by GaoYy on 2018/12/4.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class EdetailViewController: UIViewController {

    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var eimage: UIImageView!
    @IBOutlet weak var ename: UILabel!
    @IBOutlet weak var estar: UILabel!
    @IBOutlet weak var eillust: UILabel!
    @IBOutlet weak var elv1hp: UILabel!
    @IBOutlet weak var elv1atk: UILabel!
    @IBOutlet weak var elvmaxhp: UILabel!
    @IBOutlet weak var elvmaxatk: UILabel!
    @IBOutlet weak var eskillmax: UILabel!
    @IBOutlet weak var eintro: UILabel!
    var eid:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadedata()
        back.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func tapped(_ button:UIButton){
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    func loadedata(){
        eid=eid!+1
        let stname="e_"+String(eid!)
        let image=UIImage(named:stname+"A")
        var name=""
        var star=""
        var illust=""
        var lv1hp=""
        var lv1atk=""
        var lvmaxhp=""
        var lvmaxatk=""
        var skillmax=""
        var intro=""
        let path = Bundle.main.path(forResource:stname,ofType:"json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDic = json as!Dictionary<String,Any>
            name=jsonDic["NAME_CN"]as!String
            star=jsonDic["STAR"]as!String
            illust=jsonDic["ILLUST"]as!String
            lv1hp=jsonDic["LV1_HP"]as!String
            lv1atk=jsonDic["LV1_ATK"]as!String
            lvmaxhp=jsonDic["LVMAX_HP"]as!String
            lvmaxatk=jsonDic["LVMAX_ATK"]as!String
            skillmax=jsonDic["SKILLMAX_E"]as!String
            intro=jsonDic["INTRO"]as!String
            ename.text=name
            estar.text=star
            eillust.text=illust
            elv1hp.text=lv1hp
            elv1atk.text=lv1atk
            elvmaxhp.text=lvmaxhp
            elvmaxatk.text=lvmaxatk
            eskillmax.text=skillmax
            eintro.text=intro
            eimage.image=image
        }catch let erro as Error!{
            print("读取本地数据出现错误！",erro)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
