//
//  HowPayTableViewController.swift
//  HOWPAY
//
//  Created by 廖昱晴 on 2020/8/5.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import UIKit

class howToPayTableViewController: UITableViewController {
    var saleInformation:[SaleInformation] = [SaleInformation(store: "7-11", saleMessage: "line points 7%回饋"), SaleInformation(store: "電影院", saleMessage: "現金回饋5%"), SaleInformation(store: "康是美", saleMessage: "不限金額88折"), SaleInformation(store: "屈臣氏", saleMessage: "line points 5%回饋"), SaleInformation(store: "線上購物", saleMessage: "現金回饋5%"), SaleInformation(store: "麥當勞", saleMessage: "line points 50點"), SaleInformation(store: "全家", saleMessage: "現金回饋8%"), SaleInformation(store: "Uber Eats", saleMessage: "line points 2%")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return saleInformation.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! InformationTableViewCell
        
        cell.storeLable.text = saleInformation[indexPath.row].store
        cell.informationLabel.text = saleInformation[indexPath.row].saleMessage

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
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
