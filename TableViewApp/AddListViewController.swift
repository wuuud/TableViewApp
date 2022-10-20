//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by H M on 2022/10/16.
//

import UIKit

class AddListViewController: UIViewController {
    //  オプショナルではないので、初期値を入れてあげる
    var taskArray: [String] = []
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var addText: UITextField!
    //    Tableview.controllerから貼り付け
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
        //まずはUserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        if addText.text != "" {
            taskArray.append(addText.text!)
            userDefaults.set(taskArray, forKey: "add")
            self.navigationController?.popViewController(animated: true)
            errorLabel.text = ""
        } else if addText.text == "" {
            errorLabel.text = "未入力です"
        }
    }
}
