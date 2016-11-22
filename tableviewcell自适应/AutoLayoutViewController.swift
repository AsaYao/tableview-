//
//  AutoLayoutViewController.swift
//  tableviewcell自适应
//
//  Created by 姚祚成 on 16/11/22.
//  Copyright © 2016年 EMYZC. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(){
        let nibNameOrNil = NSStringFromClass(AutoLayoutViewController.self).components(separatedBy: ".").last!
    
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "利用autolayoutView进行自适应"

        self.tableview.delegate = self
        self.tableview.dataSource = self
//        self.tableview.rowHeight = UITableViewAutomaticDimension
        
        //注册cell
        self.tableview.register(UINib.init(nibName: "AutoCell", bundle: nil), forCellReuseIdentifier: "autocell")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AutoLayoutViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentAry.count;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "autocell"
        var cell = tableView .dequeueReusableCell(withIdentifier: id) as! AutoCell?
        if cell == nil {
             cell = Bundle.main.loadNibNamed("AutoCell", owner: nil, options: nil)?.first as! AutoCell?
        }
        
        cell?.cellLabel.text = contentAry[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
//        let cell = tableview.cellForRow(at: indexPath) as! AutoCell?
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "autocell") as! AutoCell?
        cell?.cellLabel.text = contentAry[indexPath.row]
        cell?.setNeedsUpdateConstraints()
        cell?.updateConstraintsIfNeeded()
//        CGFloat height = cell?.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        let height = (cell?.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height)! as CGFloat
        return height + 1;
        
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
    
}
