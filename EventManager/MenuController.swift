//
//  MenuController.swift
//  EventManager
//
//  Created by Nazar Prysiazhnyi on 1/11/19.
//  Copyright © 2019 Nazar Prysiazhnyi. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.alert(title: "Some action!", message: "Transition to \( sender.title(for: UIControl.State.normal) ?? "")")
    }

}

extension UIViewController {
     func alert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
