//
//  AccountViewController.swift
//  TikiToker
//
//  Created by Michael Amiro on 21/12/2020.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AccountHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountHeaderTableViewCell")
    }
}
extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "") else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableCell(withIdentifier: "AccountHeaderTableViewCell") as? AccountHeaderTableViewCell else { return UITableViewCell() }
        header.configure(using: UserProfile(profileImage: #imageLiteral(resourceName: "amiro-memoji"), username: "theamiro", stats: Statistics(followingCount: 200, followerCount: 290, likesCount: 400), verified: true))
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    
}
