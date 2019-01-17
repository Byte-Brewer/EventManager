//
//  MyCardVC.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/16/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit
import MessageUI

class MyCardVC: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var positionLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var qrView: UIView!
    
    
    var isMyContact = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isMyContact {
//            self.navigationController?.navigationItem.rightBarButtonItem = nil
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor.clear
            qrView.isHidden = true
        }
        setupView()
    }
    
    
    var contact: ContactElement?
    
    
    func setupView() {
        if let contact = contact {
            self.navigationItem.title = "Contact"
            nameLbl.text = contact.name
            positionLbl.text = contact.position
            companyLbl.text = contact.company
//            placeLbl.text = contact.address
            infoLbl.text = contact.about
        }
    }
    
    @IBAction func phoneAction(_ sender: UIButton) {
        
        let phone = "tel://";
        let str = sender.titleLabel?.text
        let url = URL(string: phone + str!.replacingOccurrences(of: " ", with: ""))
        
        guard url != nil else {
            return
        }
        
        if #available(iOS 10, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    @IBAction func emailAction(_ sender: UIButton) {
        
        guard let email = sender.titleLabel?.text , email != "" else {
            return
        }
        
        if !MFMailComposeViewController.canSendMail() {
            Swift.print("Mail services are not available")
            return
        }
        
        let composeVC = MFMailComposeViewController()
        composeVC.mailComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.setToRecipients([email])
        composeVC.setSubject("EventManager shared your contact")
        composeVC.setMessageBody("Hey EventManager! Here's my feedback.", isHTML: false)
        
        // Present the view controller modally.
        self.present(composeVC, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult, error: Error?) {
        // Check the result or perform other tasks.
        
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func skypeAction(_ sender: UIButton) {
        let Username = sender.titleLabel?.text
        let appURL = NSURL(string: "skype:echo123?call")! // Yes it is work
        let webURL = NSURL(string: "https://skype.com/\(Username!)")! // http://itunes.com/apps/skype/skype
        let application = UIApplication.shared
        if !application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
    
    @IBAction func twitterAction(_ sender: UIButton) {
        let Username = sender.titleLabel?.text
        let appURL = NSURL(string: "twitter:///user?screen_name=\(Username!)")!
        let webURL = NSURL(string: "https://twitter.com/\(Username!)")!
        let application = UIApplication.shared
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            // if Instagram app is not installed, open URL inside Safari
            application.open(webURL as URL)
        }
    }
}
