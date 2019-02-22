//
//  EventCell.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/10/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var countPeopleLbl: UILabel!
    
    @IBOutlet weak var infoLbl: UILabel!
    
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createButton(isHere: false)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        createButton(isHere: false)
    }
    
    @IBAction func eventButtonAction(_ sender: UIButton) {
        createButton(isHere: true)
    }
    
    private var arrayOfName = ["log0", "log1", "log2", "log3", "log4", "log5", "log6"]
    
    func setupCell(event: Event) {
        nameLbl.text = event.name
        placeLbl.text = event.place
        dateLbl.text = event.date
        infoLbl.text = event.info
        createButton(isHere: event.isHere)
        countPeopleLbl.text = "\(event.friendsCount) people from your contact are interested"
        eventImage.image = UIImage(named: arrayOfName[Int.random(in: 0..<arrayOfName.count)])
    }
    
    func createButton(isHere: Bool) {
        if isHere {
            self.eventButton.setTitle("I'm here", for: UIControl.State.normal)
            self.eventButton.backgroundColor = UIColor(red: 42.0/255.0, green: 188.0/255.0, blue: 54.0/255.0, alpha: 1.0)
        } else {
            self.eventButton.setTitle("Want to visit", for: UIControl.State.normal)
            self.eventButton.backgroundColor = .blue
        }
    }
}
