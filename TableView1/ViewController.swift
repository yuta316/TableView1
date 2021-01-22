//
//  ViewController.swift
//  TableView1
//
//  Created by 石川裕太 on 2021/01/22.
//

import UIKit

//Delegateの宣言
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var textfield: UITextField!
    
    //文字を格納 keyboardが押された時
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegateの設定
        tableview.delegate = self
        tableview.dataSource = self
        textfield.delegate = self
    }
    
    //2.セルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    //1.セクションの数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1    }
    //3.セルの構築
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // セルの枠を消す
        cell.selectionStyle = .none
        //テキストラベルが空でなければ
        //indexPath.row番目をtextlabelに反映
        cell.textLabel?.text = textArray[indexPath.row]
        //イメージビューが空でなければ画像を渡す
        cell.imageView!.image = UIImage(named: "good")
        return cell
    }
    //セルがタップされた時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //タップした番号に保存されている配列の中身を渡す
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! NextViewController
        
        nextVC.toDoString = textArray[indexPath.row]
        //画面遷移
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    //セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/8
    }
    //keyboardのreturnが押された時文字を格納
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textArray.append(textfield.text!)
        //keyboard閉じる
        textfield.resignFirstResponder()
        //空にする
        textfield.text=""
        //
        tableview.reloadData()
        
        return true
    }

}

