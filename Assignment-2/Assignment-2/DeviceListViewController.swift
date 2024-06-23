//
//  DeviceListViewController.swift
//  Assignment-2
//
//  Created by Naitik Ratilal Patel on 10/06/24.
//

import UIKit

class DeviceListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
    }
    
    // Initially setting up the view
    private func setupView() {
        self.title = "Laptops"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonAction))
    }
    
    // Adding table view delegate and datasource
    private func setupTableView() {
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
    }
    
    // adding 'Add Button' in the navigation bar
    @objc func addButtonAction() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Device", message: "Please enter new device details.", preferredStyle: .alert)
            
            // adding text fields inside the alert
            alertController.addTextField { (textField) in
                textField.placeholder = "Enter device name"
            }
            
            alertController.addTextField { (textField) in
                textField.placeholder = "Enter processor"
            }
            
            alertController.addTextField { (textField) in
                textField.placeholder = "Enter price"
            }
            
            
            // alert action
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                
                if let textFields = alertController.textFields {
                    let name = textFields[0].text ?? ""
                    let process = textFields[1].text ?? ""
                    let price = textFields[2].text ?? ""
                    
                    // checking for empty fields
                    if (name.isEmpty || process.isEmpty || price.isEmpty) {
                        self.presentAlert(errorMessage: "Oops, empty field passed.")
                    } else {
                        // checking for valid price datatype (double)
                        if let price = Double(price) {
                            let device = Device(name: name, processor: process, price: price)
                                
                            devices.append(device)
                            
                            DispatchQueue.main.async {
                                self.listTableView.reloadData()
                            }
                        } else {
                            self.presentAlert(errorMessage: "Please enter price in valid formate.")
                        }
                    }
                }
            }))
            
            self.present(alertController, animated: true)
        }
    }
    
    private func presentAlert(errorMessage: String) {
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true)
    }
}

extension DeviceListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count // count of total items inside devices array
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // height of the cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DeviceListTableViewCell
        
        let device = devices[indexPath.item]
        cell.selectionStyle = .none
        
        // method to setup cell with the specific data
        cell.setupCell(name: device.name, processor: device.processor, price: device.price)
        
        return cell
    }
}
