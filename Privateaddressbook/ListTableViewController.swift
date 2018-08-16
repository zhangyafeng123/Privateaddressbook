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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)

        cell.textLabel?.text = personList[indexPath.row].name
        cell.detailTextLabel?.text = personList[indexPath.row].phone

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //执行 segue
        performSegue(withIdentifier: "list2detail", sender: indexPath)
        
    }
   
    //控制器跳转方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //目的地
        //as! 根据前面的值来判断
        let vc = segue.destination as! DetailTableViewController
        //设置选中的 person indexPath
        //注意 if let 和 guard let 一律使用 as?
        if let indexpath = sender as? IndexPath {
            //indexpath 一定有值
            vc.person = personList[indexpath.row]
        }
    }
}
