//
//  AccountHeaderTableViewCell.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

struct UserProfile {
    var profileImage: UIImage
    var username: String
    var stats: Statistics
    var verified: Bool
}

struct Statistics {
    var followingCount: Int
    var followerCount: Int
    var likesCount: Int
}


class AccountHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var verificationBadge: UIImageView!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(using data: UserProfile) {
        self.profileImage.image = data.profileImage
        self.usernameLabel.text = {
            return "@" + data.username
        }()
        self.verificationBadge.isHidden = !data.verified
        self.followingCount.text = String(data.stats.followingCount)
        self.followerCount.text = String(data.stats.followerCount)
        self.likesCount.text = String(data.stats.likesCount)
    }
    @IBAction func editProfileButtonTapped(_ sender: Any) {
    }
    
    @IBAction func favouritesButtonTapped(_ sender: Any) {
    }
    
}
