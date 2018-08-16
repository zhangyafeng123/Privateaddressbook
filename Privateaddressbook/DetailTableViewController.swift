//
//  DetailTableViewController.swift
//  Privateaddressbook
//
//  Created by 张亚峰 on 2018/8/16.
//  Copyright © 2018年 zhangyafeng. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var phoneText: UITextField!
    
    @IBOutlet weak var titleText: UITextField!
    
    var person: Person?
    
    var completionCallBack: (()->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //判断person是否有zhi
        if person != nil {
            nameText.text = person?.name
            phoneText.text = person?.phone
            titleText.text = person?.title
        }
       
    }
    
    @IBAction func savePerson(_ sender: UIBarButtonItem) {
        //更新 person 的内容
        person?.name = nameText.text
        person?.phone = phoneText.text
        person?.title = titleText.text
        //执行闭包回调 在点击保存按钮这个时机，执行一段代码，但是这个代码是在上个界面的
        completionCallBack?()
        //返回上个界面
        // _ 忽略一切不关心的内容
       _ = navigationController?.popViewController(animated: true)
        
    }
    
    
   

}
