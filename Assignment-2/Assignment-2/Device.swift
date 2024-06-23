//
//  Device.swift
//  Assignment-2
//
//  Created by Naitik Ratilal Patel on 10/06/24.
//

import Foundation

// Device model
struct Device {
    let name: String
    let processor: String
    let price: Double
}

/* 
    Adding hardcoded data
    Added "IBM Tablet" at the first place as the fifth number in my conestoga student ID "8966104" is '1'
 
    Using global 'devices' array so, user entered data will not erase when list view controller reloads. So, we do not need core data to store data.
*/
var devices: [Device] = [
    Device(name: "IBM Tablet (8966104)", processor: "14.59GHz", price: 999.00),
    Device(name: "HP", processor: "1.7GHz", price: 1099.00),
    Device(name: "Macbook", processor: "2.9GHz", price: 2299.00)
]
