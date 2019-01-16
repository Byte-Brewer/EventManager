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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        if UIApplication.shared.canOpenURL(URL(string: "skype")!) {
            UIApplication.shared.open(URL(string: "skype:echo123?call")!, completionHandler: nil)
        } else {
            UIApplication.shared.open(URL(string: "http://itunes.com/apps/skype/skype")!)
        }
//        {
//            BOOL installed = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"skype:"]];
//            if(installed)
//            {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"skype:echo123?call"]];
//            }
//            else
//            {
//                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://itunes.com/apps/skype/skype"]];
//            }
    }
    
    @IBAction func twitterAction(_ sender: UIButton) {
    }
}
