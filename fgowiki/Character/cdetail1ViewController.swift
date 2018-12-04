//
//  cdetail1ViewController.swift
//  fgowiki
//
//  Created by GaoYy on 2018/12/4.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class cdetail1ViewController: UIViewController {
    var cid:Int?
    
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var cimage: UIImageView!
    @IBOutlet weak var cname: UILabel!
    @IBOutlet weak var cstar: UILabel!
    @IBOutlet weak var cclass: UILabel!
    @IBOutlet weak var cillust: UILabel!
    @IBOutlet weak var ccv: UILabel!
    @IBOutlet weak var ccamp: UILabel!
    @IBOutlet weak var cproperty: UILabel!
    @IBOutlet weak var corigin: UILabel!
    @IBOutlet weak var cregion: UILabel!
    @IBOutlet weak var cattributes: UILabel!
    @IBOutlet weak var cgender: UILabel!
    @IBOutlet weak var cwhereform: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadcdata()
        back.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func tapped(_ button:UIButton){
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
    func loadcdata(){
        cid=cid!+1
        let stname="c_"+String(cid!)
        let image=UIImage(named:stname+"A")
        var name=""
        var star=""
        var class1=""
        var illust=""
        var cv=""
        var camp=""
        var property=""
        var origin=""
        var region=""
        var attributes=""
        var gender=""
        var whereform=""
        let path = Bundle.main.path(forResource:stname,ofType:"json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDic = json as!Dictionary<String,Any>
            name=jsonDic["NAME"]as! String
            star=jsonDic["STAR"]as! String
            class1=jsonDic["CLASS"]as! String
            illust=jsonDic["ILLUST"]as! String
            cv=jsonDic["CV"]as! String
            camp=jsonDic["Camp"]as! String
            property=jsonDic["Property"]as! String
            origin=jsonDic["Origin"]as! String
            region=jsonDic["Region"]as! String
            attributes=jsonDic["Attributes"]as! String
            gender=jsonDic["Gender"]as! String
            whereform=jsonDic["whereform"]as! String
            cname.text=name
            cstar.text=star
            cclass.text=class1
            cillust.text=illust
            ccv.text=cv
            ccamp.text=camp
            cproperty.text=property
            corigin.text=origin
            cregion.text=region
            cattributes.text=attributes
            cgender.text=gender
            cwhereform.text=whereform
            cimage.image=image
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
