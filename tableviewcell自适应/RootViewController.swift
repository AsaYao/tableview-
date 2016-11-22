//
//  rootViewController.swift
//  Tableview自适应
//
//  Created by 姚祚成 on 16/11/21.
//  Copyright © 2016年 EMYZC. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let diffClass:[String:String] = ["iOS8.0的做法":"iOS8ViewController","利用autolayout做法":"AutoLayoutViewController"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
      print(NSClassFromString("tableviewcell自适应."+"iOS8ViewController") as! iOS8ViewController.Type)
   

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension RootViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.diffClass.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "displaycells"
        let cell = tableview .dequeueReusableCell(withIdentifier: id) as UITableViewCell?
        cell?.textLabel?.text = Array(self.diffClass.keys)[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //项目的名称
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        //当前的类名
        let curClassname = self.diffClass[Array(self.diffClass.keys)[indexPath.row]]!
        switch indexPath.row {
        case 0:
//            let cls:AnyClass = NSClassFromString(namespace+"."+curClassname)!
            let iOS8VC = iOS8ViewController.storyboardInstance()
            self.navigationController?.pushViewController(iOS8VC!, animated: true)
        case 1:
            let autoVC = AutoLayoutViewController.init()
            self.navigationController?.pushViewController(autoVC, animated: true)
        default:
            return
        }
    }
}
