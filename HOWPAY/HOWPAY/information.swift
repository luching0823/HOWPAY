//
//  information.swift
//  HOWPAY
//
//  Created by 廖昱晴 on 2020/8/5.
//  Copyright © 2020 廖昱晴. All rights reserved.
//

import Foundation
class SaleInformation {
    var store: String
    var saleMessage: String
    
    init(store: String, saleMessage: String) {
        self.store = store
        self.saleMessage = saleMessage
    }
    convenience init(){
        self.init(store:"", saleMessage:"")
    }
}
