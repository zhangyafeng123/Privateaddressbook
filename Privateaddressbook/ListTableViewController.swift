//
//  ListTableViewController.swift
//  Privateaddressbook
//
//  Created by 张亚峰 on 2018/8/16.
//  Copyright © 2018年 zhangyafeng. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    var personList = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData { (list) in
            print(list)
            //拼接数组 闭包中定义好的代码在需要的时候执行，所以需要 self. 指定语境
            self.personList += list
            
            self.tableView.reloadData()
            
        }
    }
    //模拟异步加载
    private func loadData(completion:@escaping (([Person]))->())->(){
        DispatchQueue.global().async {
            print("努力加载数据中")
            Thread.sleep(forTimeInterval: 1)
            
            var arrayM = [Person]()
            for i in 0..<20 {
                let p = Person()
                p.name = "zhangsan - \(i)"
                p.phone = "1770" + String(format: "%06d", arc4random_uniform(100000))
                p.title = "boss"
                arrayM.append(p)
            }
            
            ///主线程回调
            DispatchQueue.main.async {
                //回调执行闭包
                completion(arrayM)
            }
        }
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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

}
