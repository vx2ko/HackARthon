//
//  ItemTableViewController.swift
//  HackARthon
//
//  Created by Kiyano Oben on 7/25/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import UIKit
import CoreData

class ItemTableViewController: UITableViewController {
    
    
    let arViewVC = ARViewController()
    //var itemVCArray = [String]()
    //var itemImageArray = [UIImage]()
    //var itemEntityArray = [NSManagedObject]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //itemTableView.reloadData()
        itemTableView.dataSource = self
        itemTableView.delegate = self
        itemTableView.register(UITableViewCell.self, forCellReuseIdentifier: "itemCell")

        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Item")
        
        do {
            arViewVC.itemsCDArray = try managedContext.fetch(fetchRequest)
            print(arViewVC.itemsCDArray)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arViewVC.itemsCDArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = arViewVC.itemsCDArray[indexPath.row]
        let imageName = item.value(forKeyPath: "imageName") as? String
        let imageNameString: String! = imageName
        print(imageNameString)
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        itemCell.imageView?.image = UIImage(named: imageNameString)
        //itemCell.imageView?.image = itemImageArray[indexPath.item]
        itemCell.textLabel?.text = item.value(forKeyPath: "name") as? String
        //itemCell.textLabel?.text = itemVCArray[indexPath.item]
        return itemCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped row \(indexPath.row)")
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "ItemARViewController") as! ItemARViewController
        navigationController?.pushViewController(destination, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
