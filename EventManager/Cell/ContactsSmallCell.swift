//
//  ContactsSmallCell.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/14/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class ContactsSmallCell: UITableViewCell {

    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactsName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(friends: ContactElement) {
        contactsName.text = friends.name
        contactImage.image = generateImage(friends.gender == "male")
    }
    
    func generateImage(_ bool: Bool) -> UIImage {
        return (bool ? UIImage(named: (ManImage.allCases.randomElement()?.rawValue)!) : UIImage(named: (WomanImage.allCases.randomElement()?.rawValue)!))!
    }
}
