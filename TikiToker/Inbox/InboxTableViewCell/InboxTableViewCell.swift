//
//  InboxTableViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 22/12/2020.
//

import UIKit

class InboxTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(using message: Message) {
        switch message.type{
            case .audio:
                self.typeImage.image = UIImage(systemName: "music.note")
            case .hashtag:
                self.typeImage.image = UIImage(systemName: "number")
        }
        self.messageTitle.text = message.message
        self.timeLabel.text = message.time
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
