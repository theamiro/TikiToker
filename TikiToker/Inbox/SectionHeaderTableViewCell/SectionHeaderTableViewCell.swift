//
//  SectionHeaderTableViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 22/12/2020.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var sectionTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(using inbox: Inbox) {
        sectionTitle.text = inbox.date
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
