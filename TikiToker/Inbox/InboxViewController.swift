//
//  InboxViewController.swift
//  TikiToker
//
//  Created by Michael Amiro on 22/12/2020.
//

import UIKit

struct Inbox {
    var date: String
    var message: [Message]
}
struct Message {
    var type: TagType
    var message: String
    var time: String
}
class InboxViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let inbox: [Inbox] = [
        Inbox(date: "Today", message: [
            Message(type: .hashtag, message: "#DynamicChallenge", time: "8h"),
            Message(type: .audio, message: "#GloryGlory", time: "2h"),
            Message(type: .hashtag, message: "#CoronaVirus", time: "1h"),
            Message(type: .audio, message: "#CardiB", time: "20m"),
        ]),
        Inbox(date: "Previous", message: [
            Message(type: .hashtag, message: "#YearOnTikitoker", time: "4w"),
            Message(type: .audio, message: "#SampleMusic", time: "1m"),
            Message(type: .hashtag, message: "#YearOnTikitoker", time: "2m"),
            Message(type: .audio, message: "#YearOnTikitoker", time: "12m"),
        ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "InboxTableViewCell", bundle: nil), forCellReuseIdentifier: "InboxTableViewCell")
        tableView.register(UINib(nibName: "SectionHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionHeaderTableViewCell")
    }
}
extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return inbox.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return inbox[section].date
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inbox[section].message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InboxTableViewCell") as? InboxTableViewCell else { return UITableViewCell() }
        cell.configure(using: inbox[indexPath.section].message[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell") as? SectionHeaderTableViewCell else { return UITableViewCell() }
        header.configure(using: inbox[section])
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}
