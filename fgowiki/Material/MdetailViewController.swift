//
//  MdetailViewController.swift
//  fgowiki
//
//  Created by apple on 2018/12/3.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class MdetailViewController: UIViewController {
    var mid:Int?
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var mimage: UIImageView!
    @IBOutlet weak var mname: UILabel!
    @IBOutlet weak var mclass: UILabel!
    @IBOutlet weak var mabout: UILabel!
    @IBOutlet weak var mplace: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadmdata()
        back.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func tapped(_ button:UIButton){
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadmdata(){
        mid=mid!+1
        let stname="m_"+String(mid!)
        let image=UIImage(named:stname)
        var name=""
        var place=""
        var class1=""
        var about=""
        let path = Bundle.main.path(forResource:stname,ofType:"json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDic = json as!Dictionary<String,Any>
            name = jsonDic["NAME"]as!String
            place = jsonDic["PLACE"]as!String
            class1=jsonDic["CLASS"]as!String
            about=jsonDic["ABOUT"]as!String
        }catch let erro as Error!{
            print("读取本地数据出现错误！",erro)
        }
        mimage.image=image
        mname.text=name
        mplace.text=place
        mclass.text=class1
        mabout.text=about
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
