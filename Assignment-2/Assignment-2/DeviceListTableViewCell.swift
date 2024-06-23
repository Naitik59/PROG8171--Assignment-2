//
//  DeviceListTableViewCell.swift
//  Assignment-2
//
//  Created by Naitik Ratilal Patel on 10/06/24.
//

import UIKit

class DeviceListTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var deviceProcessor: UILabel!
    @IBOutlet weak var devicePrice: UILabel!
    
    // function to setup cell. This will be called in table view data source method "cellForRowAt"
    func setupCell(name: String, processor: String, price: Double) {
        self.deviceName.text = name
        self.deviceProcessor.text = processor
        self.devicePrice.text = "$\(price)"
    }
}
