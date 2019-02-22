//
//  EventTVController.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/10/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class EventTVController: UITableViewController {
    
    private let contacts = ContactsModel.shared.arrayOfContacts
    private let tempModel = EventModel(count: 20).arrayOfEvents
    private var model: [Event]!
    
    private var filters = 0 {
        didSet {
            switch filters {
            case 0: model = tempModel
            case 1: model = tempModel.filter{ $0.place == "Vancouver , Canada" }
            case 2: model = tempModel.filter{ $0.name == "WWDC19" }
            default:
                break
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        tableView.register(UINib(nibName: "EventCell", bundle: nil), forCellReuseIdentifier: "EventTVCell")
        tableView.estimatedRowHeight = 220.0
        tableView.rowHeight = UITableView.automaticDimension
        model = tempModel
    }
    
    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
        filters = sender.selectedSegmentIndex
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTVCell", for: indexPath) as! EventCell
        cell.setupCell(event: model[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! EventDetailVC
        detailVC.event = model[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
