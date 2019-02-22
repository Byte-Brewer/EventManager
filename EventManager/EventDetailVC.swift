//
//  EventDetailVC.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/14/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class EventDetailVC: UIViewController {
    
    private let contacts = ContactsModel.shared.arrayOfContacts
    var event: Event?
    var arrayOfContacts = [ContactElement](){
        didSet{
            print("count : ", arrayOfContacts.count)
        }
    }
    
    @IBOutlet weak var eventNameLbl: UILabel!
    @IBOutlet weak var eventPlaceLbl: UILabel!
    @IBOutlet weak var eventDateLbl: UILabel!
    @IBOutlet weak var eventInfoLbl: UILabel!
    
    @IBOutlet weak var overviewBtn: UIButton!
    @IBOutlet weak var programBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupView(event: event!)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("showAllParticipants"), object: nil, queue: nil, using: showAllParticipants)  // old version
        tableView.register(UINib(nibName: "ContactsSmallCell", bundle: nil), forCellReuseIdentifier: "ContactsSmallCell")
        tableView.register(UINib(nibName: "EventDetailHeaderCell", bundle: nil), forCellReuseIdentifier: "EventDetailHC")
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    @IBAction func topBarAction(_ sender: UIButton) {
    }
    
    func setupView(event: Event) {
        self.eventNameLbl.text = event.name
        self.eventPlaceLbl.text = event.place
        self.eventDateLbl.text = event.date
        self.eventInfoLbl.text = event.info
        for _ in 0...event.friendsCount {
            arrayOfContacts.append(contacts![Int.random(in: 0..<(contacts?.count)!)])
        }
        self.tabBarController?.tabBar.items![1].badgeValue = String(event.friendsCount)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.items![1].badgeValue = nil
    }
    
    @IBAction func allOfParticipants(_ sender: UIBarButtonItem) {
        let contactsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactsTVC") as! ContactsTVController
        contactsVC.typeContacts = .all
        self.navigationController?.pushViewController(contactsVC, animated: true)
    }

}

extension EventDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.event!.friendsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventDetailHC") as! EventDetailHeaderCell
            cell.selectionStyle = .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsSmallCell", for: indexPath) as! ContactsSmallCell
        cell.setupCell(friends: arrayOfContacts[indexPath.row - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.row != 0 else { return }
        let contactsDetailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactsDetailVC") as! ContactsDetailVC
        contactsDetailVC.contact = arrayOfContacts[indexPath.row - 1]
        self.navigationController?.pushViewController(contactsDetailVC, animated: true)
    }
    
// old version
    private func showAllParticipants(notification: Notification) {
        let invaitVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InviteContactsTVController") as! InviteContactsTVController
        self.navigationController?.pushViewController(invaitVC, animated: true)
    }

}
