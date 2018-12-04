//
//  EquipTableViewController.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class EquipTableViewController: UITableViewController {
    var equips = [Equip]()
    //MARK: Private Methods
    private func loadEquip() {
        for i in 1...901{
            let stname="e_"+String(i)
            let image=UIImage(named:stname+"head")
            var name=""
            var skillmax=""
            let path = Bundle.main.path(forResource:stname,ofType:"json")
            let url = URL(fileURLWithPath: path!)
            do{
                let data = try Data(contentsOf: url)
                let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
                let jsonDic = json as!Dictionary<String,Any>
                name = jsonDic["NAME_CN"]as!String
                skillmax = jsonDic["SKILLMAX_E"]as!String
            }catch let erro as Error!{
                print("读取本地数据出现错误！",erro)
            }
            guard let c = Equip(Name: name, Image: image, Skillmax: skillmax,Star:"",Lv1hp:"",Lv1atk:"",Lvmaxhp:"",Lvmaxatk:"",Cost:"",Illust:"",Intro:"") else {
                fatalError("Unable to instantiate meal1")
            }
            equips += [c]
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadEquip()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

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
        return equips.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EquipTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as? EquipTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")}
        // Fetches the appropriate meal for the data source layout.
        let equip = equips[indexPath.row]
        
        cell.ename.text = equip.Name
        cell.eimage.image = equip.Image
        cell.eskillmax.text = equip.Skillmax
        // Configure the cell...
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView!.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "edetail", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edetail"{
            let controller = segue.destination as! EdetailViewController
            controller.eid = sender as? Int
        }
    }
}
