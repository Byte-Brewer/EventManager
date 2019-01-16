//
//  EventDetailHeaderCell.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/15/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class EventDetailHeaderCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func showAll(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("showAllParticipants"), object: nil)
    }
    
}
