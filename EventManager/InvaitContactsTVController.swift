//
//  InvaitContacts.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/15/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class InvaitContactsTVController: UITableViewController {
    
    var arrayOfContacts = ContactsModel.shared.arrayOfContacts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = true
        tableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
        tableView.allowsMultipleSelectionDuringEditing = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (arrayOfContacts?.count)!
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        cell.setupCell(contact: arrayOfContacts![indexPath.row], isInvaitCell: true)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactsDetailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactsDetailVC") as! ContactsDetailVC
        contactsDetailVC.contact = arrayOfContacts![indexPath.row]
        self.navigationController?.pushViewController(contactsDetailVC, animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let rowAction = UITableViewRowAction(style: UITableViewRowAction.Style.normal, title: "Title", handler: { (action, indexPath) in
//            //            self.list.remove(at: indexPath.row)
//            tableView.reloadData()
//        })
//        rowAction.backgroundColor = .yellow
//
//        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
//        visualEffectView.frame = tableView.cellForRow(at: indexPath)!.bounds
//        tableView.cellForRow(at: indexPath)!.addSubview(visualEffectView)
//        return [rowAction]
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        print("trailingSwipeActionsConfigurationForRowAt")
        let deleteAction = UIContextualAction(style: .destructive, title: "Decline") { (action, view, handler) in
            
//            tableView.beginUpdates()
            self.arrayOfContacts?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
//            tableView.endUpdates()
            print("Delete Action Tapped")
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        print("leading trailingSwipeActionsConfigurationForRowAt")
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Accept") { (action, view, handler) in
            print("Add Action Tapped")
            self.arrayOfContacts?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
            tableView.reloadData()
        }
        deleteAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
