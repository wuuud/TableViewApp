//
//  AddListViewController.swift
//  TableViewApp
//
//  Created by H M on 2022/10/16.
//

import UIKit

class AddListViewController: UIViewController {
    @IBOutlet weak var addText: UITextField!
    //  オプショナルではないので、初期値を入れてあげる
    var taskArray: [String] = []
    //    Tableview.controllerから貼り付け
    override func viewDidLoad() {
        super.viewDidLoad()
        //まずはUserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            taskArray = userDefaults.object(forKey: "add") as! [String]
            //削除機能UserDefaultsからすでに削除されているタスクをtaskArrayから除く？
            if userDefaults.object(forKey: "delete") != nil {
                taskArray = userDefaults.object(forKey: "delete") as! [String]
            }
        }
    }
    @IBAction func addTask(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
        taskArray.append(addText.text!)
        //配列のラストにTextFieldで記入されたテキストを追加
        //キー"add"で配列をUserDefaultsにuserDefaults.setで保存
        userDefaults.set(taskArray, forKey: "add")
        //1つ前の画面に戻る 決まり
        self.navigationController?.popViewController(animated: true)
    }
}
