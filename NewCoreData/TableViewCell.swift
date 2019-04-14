//
//  TableViewCell.swift
//  NewCoreData
//
//  Created by Anh vũ on 4/11/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
@IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
