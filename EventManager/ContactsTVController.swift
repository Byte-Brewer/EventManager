//
//  ContactsTVController.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/11/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

enum TypeContacts: Int {
    case request = 0
    case all = 1
}

class ContactsTVController: UITableViewController {
    

    var contacts = ContactsModel.shared.arrayOfContacts.compactMap({$0})
    
    var typeContacts = TypeContacts.request {
        didSet {
            contacts = typeContacts == .request ? contacts.filter({$0.isActive}) : contacts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ContactsCell", bundle: nil), forCellReuseIdentifier: "ContactsCell")
        self.clearsSelectionOnViewWillAppear = true
    }
    
    @IBAction func listTorequestAction(_ sender: UISegmentedControl) {
        typeContacts = TypeContacts.init(rawValue: sender.selectedSegmentIndex)!
    }
    
    @IBAction func addNewContact(_ sender: UIBarButtonItem) {
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
        if typeContacts == .all {
            cell.setupCell(contact: contacts[indexPath.row])
        } else {
            cell.setupCell(contact: contacts[indexPath.row], isInvaitCell: true)
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.cyan
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let contact = contacts[indexPath.row]
        
        if !contact.isActive {
            let contactsDetailVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyCardVC") as! MyCardVC
            contactsDetailVC.contact = contact
            contactsDetailVC.isMyContact = false
            self.navigationController?.pushViewController(contactsDetailVC, animated: true)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Decline") { (action, view, handler) in
            
            //            tableView.beginUpdates()
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
            //            tableView.endUpdates()
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let deleteAction = UIContextualAction(style: .destructive, title: "Accept") { (action, view, handler) in
            self.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.bottom)
            tableView.reloadData()
        }
        deleteAction.backgroundColor = .green
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let editAction = UITableViewRowAction(style: .normal, title: "Edit", handler: { (action, indexPath) in
//            let alert = UIAlertController(title: "", message: "Edit list item", preferredStyle: .alert)
//            alert.addTextField(configurationHandler: { (textField) in
////                textField.text = self.list[indexPath.row]
//            })
//            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
////                self.list[indexPath.row] = alert.textFields!.first!.text!
//                self.tableView.reloadRows(at: [indexPath], with: .fade)
//            }))
//            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//            self.present(alert, animated: false)
//        })
//
//        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
////            self.list.remove(at: indexPath.row)
//            tableView.reloadData()
//        })
//
//        return [deleteAction, editAction]
//    }
    
}
