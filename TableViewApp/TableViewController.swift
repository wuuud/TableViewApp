//
//  TableViewController.swift
//  TableViewApp
//
//  Created by H M on 2022/10/16.
//
import UIKit

class TableViewController: UITableViewController{
    // 画面内に表示する名前を入れています。
    //    var names: [String] = [
    //        "阿部",
    //        "石田",
    //        "上田",
    //        "遠藤",
    //        "及川",
    //        "梶原",
    //        "菊池",
    //        "工藤",
    //    ]
    
    // AddListViewController.swiftで保存したタスクの配列を格納する変数
    var taskArray: [String] = []
    
    //    画面が表示されるときに1度だけ表示される
    override func viewDidLoad() {
        super.viewDidLoad()
        //エラー解消 UserDefaultsからすでに入力されているタスクをtaskArrayに読み込む
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "taskArray") != nil {
            taskArray = userDefaults.object(forKey: "taskArray") as! [String]
        }
    }
    
    //画面再表示
    // キー"add"ですでに保存されていた配列を変数taskArrayに読み込む
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 下記2行はaddlistviewcontrollerにも記載
        let userDefaults = UserDefaults.standard
        //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
        if userDefaults.object(forKey: "add") != nil {
            taskArray = userDefaults.object(forKey: "add") as! [String]
        }
        //tableViewを更新
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //        returnの値を1に書き換えることで、セクションの数は1つだけだという指定
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // 今回はセクションは1つのみなので、namesの要素数をそのまま使います。
        // "変数名.count"で要素数を取得できます。変数namesは一番上でvar names: [String] で定義
        //  return names.count
        return taskArray.count
    }
    
    //１セルの中身を設定  削除   追加
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルのオブジェクトを作成  "NameCell" の部分はStoryboardでセルに設定したIdentifierを指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        // namesから該当する行の文字列を取得してセルに設定します。
        // indexPath.row  一番上で定めた配列の何番目
        // cell.textLabel?.text = names[indexPath.row]
        // let taskList = taskArray[indexPath.row]    cell.textLabel?.text = taskList
        cell.textLabel?.text = taskArray[indexPath.row]
        return cell
    }
    
    // セルの削除機能https://satoriku.com/dev-app-step14/
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            taskArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            // 追加：削除した内容を保存
            let userDefaults = UserDefaults.standard
            userDefaults.set(taskArray, forKey: "add")
        }
    }
}
