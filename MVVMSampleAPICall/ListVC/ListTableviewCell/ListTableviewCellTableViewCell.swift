//
//  ListTableviewCellTableViewCell.swift
//  MVVMSampleAPICall
//
//  Created by Anilkumar on 12/04/25.
//

import UIKit

class ListTableviewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayDataIntoTable(title: String) {
        titleLabel.text = title
        titleLabel.numberOfLines = 0
    }
    
}
