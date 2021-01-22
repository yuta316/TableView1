//
//  NextViewController.swift
//  TableView1
//
//  Created by 石川裕太 on 2021/01/22.
//

import UIKit

class NextViewController: UIViewController {
    
    //文字を受け取る変数
    var toDoString = String()
    @IBOutlet weak var todolabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        //受け取った文字を表示
        todolabel.text = toDoString
        
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
