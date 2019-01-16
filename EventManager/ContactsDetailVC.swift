//
//  ContactsDetailVC.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/15/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class ContactsDetailVC: UIViewController {
    
     var contact: ContactElement?
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var about: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(contact: contact!)
    }
    
    private func setupView(contact: ContactElement) {
        name.text = contact.name
        position.text = contact.position
        company.text = contact.company
        email.text = contact.email
        phone.text = contact.phone
        address.text = contact.address
        gender.text = contact.gender
        about.text = contact.about
    }
}
