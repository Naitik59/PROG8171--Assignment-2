//
//  ViewController.swift
//  Assignment-2
//
//  Created by Naitik Ratilal Patel on 10/06/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func navigateToListViewController(_ sender: UIButton) {
        
        /*
            sender.tag '0' is for monitors button and '1' for laptops button.
            
            on monitor button press, presenting the alert and on laptop button tap action, navigating to list view controller
         */
        
        if sender.tag == 0 {
            presentAlert()
        } else {
            let vc = storyboard?.instantiateViewController(withIdentifier: "DeviceListViewController") as! DeviceListViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func presentAlert() {
        let alertController = UIAlertController(title: "Oops", message: "No moitors yet. Check back later!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alertController, animated: true)
    }
}

