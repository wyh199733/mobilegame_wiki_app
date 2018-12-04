//
//  MaterialTableViewController.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class MaterialTableViewController: UITableViewController {
    var materials = [Material]()
    //MARK: Private Methods
    private func loadMaterial() {
        for i in 1...74{
            let stname="m_"+String(i)
            let image=UIImage(named:stname)
            var name=""
            var place=""
            let path = Bundle.main.path(forResource:stname,ofType:"json")
            let url = URL(fileURLWithPath: path!)
            do{
                let data = try Data(contentsOf: url)
                let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
                let jsonDic = json as!Dictionary<String,Any>
                name = jsonDic["NAME"]as!String
                place = jsonDic["PLACE"]as!String
            }catch let erro as Error!{
                print("读取本地数据出现错误！",erro)
            }
            guard let c = Material(Name: name, Image: image, Place: place, Class: "",About:"") else {
                fatalError("Unable to instantiate meal1")
            }
            materials += [c]
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMaterial()
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
        return materials.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MaterialTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as? MaterialTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")}
        // Fetches the appropriate meal for the data source layout.
        let material = materials[indexPath.row]
        
        cell.mname.text = material.Name
        cell.mimage.image = material.Image
        cell.mplace.text = material.Place
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var m = UIStoryboard(name: "Main", bundle:nil)
        //var mn=m.instantiateViewController(withIdentifier: "mnavigation") as!UINavigationController
        //var md = m.instantiateViewController(withIdentifier: "MdetailViewController") as! MdetailViewController
        //let md = MdetailViewController()
        //md.mid=indexPath.row
        //self.navigationController?.pushViewController(md,animated: true)
        //self.present(md, animated: true, completion: nil)
        //mn.pushViewController(md, animated: true)
        self.tableView!.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "mdetail", sender: indexPath.row)
    }
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mdetail"{
            let controller = segue.destination as! MdetailViewController
            controller.mid = sender as? Int
        }
    }
}
