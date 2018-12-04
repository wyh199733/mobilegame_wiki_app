//
//  cdetail2ViewController.swift
//  fgowiki
//
//  Created by GaoYy on 2018/12/4.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class cdetail2ViewController: UITableViewController {
    var cid:Int?
    
    @IBOutlet weak var back: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadcdata()
        back.addTarget(self, action:#selector(tapped(_:)), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func tapped(_ button:UIButton){
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    var intro=[String]()
    var names=[String]()
    func loadcdata(){
        names+=["角色详情","羁绊故事·一","羁绊故事·二","羁绊故事·三","羁绊故事·四","羁绊故事·五","最终故事"]
        cid=cid!+1
        let stname="c_"+String(cid!)
        var intro1=""
        var intro2=""
        var intro3=""
        var intro4=""
        var intro5=""
        var intro6=""
        var intro7=""
        let path = Bundle.main.path(forResource:stname,ofType:"json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
            let jsonDic = json as!Dictionary<String,Any>
            intro1=jsonDic["INTRO1"]as! String
            intro2=jsonDic["INTRO2"]as! String
            intro3=jsonDic["INTRO3"]as! String
            intro4=jsonDic["INTRO4"]as! String
            intro5=jsonDic["INTRO5"]as! String
            intro6=jsonDic["INTRO6"]as! String
            intro7=jsonDic["INTRO7"]as! String
            intro+=[intro1,intro2,intro3,intro4,intro5,intro6,intro7]
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "cdetail2TableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as? cdetail2TableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")}
        // Fetches the appropriate meal for the data source layout.
        cell.cdname.text = names[indexPath.row]
        cell.cdtext.text = intro[indexPath.row]
        // Configure the cell...
        return cell
    }
}
