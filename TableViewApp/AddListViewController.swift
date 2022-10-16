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
//    Taableview.controllerから貼り付け
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "add") != nil{
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
    }
    @IBAction func addTask(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard //そのままだと長いので変数にいれる
        taskArray.append(addText.text!) //配列のラストにTextFieldで記入されたテキストを追加
        userDefaults.set(taskArray, forKey: "add") //キー"add"で配列をUserDefaultsにuserDefaults.setで保存
        self.navigationController?.popViewController(animated: true) //1つ前の画面に戻る 決まりとして覚えてもいいかも

        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
