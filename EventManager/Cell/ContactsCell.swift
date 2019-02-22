//
//  ContactsCell.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/11/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class ContactsCell: UITableViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var positionLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var inContactBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        inContactBtn.layer.cornerRadius = 5.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        inContactBtn.backgroundColor = .white
        inContactBtn.setTitleColor(.black, for: UIControl.State.normal)
        inContactBtn.setTitle("In Contact", for: UIControl.State.normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func inContactBtnAction(_ sender: UIButton) {
        
    }
    
    func setupCell(contact: ContactElement, isInvaitCell: Bool = false) {
        nameLbl.text = contact.name
        companyLbl.text = contact.company
        positionLbl.text = contact.position
        userImage.image = generateImage(contact.gender == "male")
        if isInvaitCell {
            inContactBtn.isHidden = true
        } else {
            if contact.isActive {
                setButton(tag: contact.index)
            }
        }
    }
    
    func generateImage(_ bool: Bool) -> UIImage {
        return (bool ? UIImage(named: (ManImage.allCases.randomElement()?.rawValue)!) : UIImage(named: (WomanImage.allCases.randomElement()?.rawValue)!))!
    }
    
    func setButton(tag: Int) {
        inContactBtn.setTitleColor(.white, for: UIControl.State.normal)
        if tag % 9 == 0 {
            inContactBtn.setTitle("Contact request", for: UIControl.State.normal)
            inContactBtn.backgroundColor = .blue
        } else {
            inContactBtn.setTitle("Requested", for: UIControl.State.normal)
            inContactBtn.backgroundColor = .gray
        }
    }
}
