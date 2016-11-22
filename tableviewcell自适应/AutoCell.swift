//
//  AutoCell.swift
//  tableviewcell自适应
//
//  Created by 姚祚成 on 16/11/22.
//  Copyright © 2016年 EMYZC. All rights reserved.
//

import UIKit

class AutoCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel.numberOfLines = 0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
