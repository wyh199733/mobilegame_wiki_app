//
//  CharacterTableViewController.swift
//  fgowiki
//
//  Created by apple on 2018/12/2.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    //MARK: Properties
    var characters = [Character]()
    //MARK: Private Methods
    private func loadCharacter() {
        for i in 1...223{
            let stname="c_"+String(i)
            let image=UIImage(named:stname+"head")
            var name=""
            var class1=""
            let path = Bundle.main.path(forResource:stname,ofType:"json")
            let url = URL(fileURLWithPath: path!)
            do{
                let data = try Data(contentsOf: url)
                let json:Any = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.mutableContainers)
                let jsonDic = json as!Dictionary<String,Any>
                name = jsonDic["NAME"]as!String
                class1 = jsonDic["CLASS"]as!String
            }catch let erro as Error!{
                print("读取本地数据出现错误！",erro)
            }
            guard let c = Character(Name: name, Image: image, Class: class1) else {
                fatalError("Unable to instantiate meal1")
            }
            characters += [c]
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCharacter()
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
        return characters.count
    }

     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // Table view cells are reused and should be dequeued using a cell identifier.
     let cellIdentifier = "CharacterTableViewCell"
     guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)as? CharacterTableViewCell  else {
     fatalError("The dequeued cell is not an instance of MealTableViewCell.")}
     // Fetches the appropriate meal for the data source layout.
     let character = characters[indexPath.row]
     
     cell.cname.text = character.Name
     cell.cimage.image = character.Image
     cell.cclass.text = character.Class
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
        self.performSegue(withIdentifier: "cdetail", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cdetail"{
            let controller = segue.destination as! UITabBarController
            let controller1=controller.customizableViewControllers?[0]as! cdetail1ViewController
            let controller2=controller.customizableViewControllers?[2]as! cdetail2ViewController
            let controller3=controller.customizableViewControllers?[1]as! cdetail3ViewController
            controller1.cid = sender as? Int
            controller2.cid = sender as? Int
            controller3.cid = sender as? Int
        }
    }
}
