//
//  Double+Extension.swift
//  Messenger
//
//  Created by sutie on 05/05/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation

extension Double {
    func toDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd HH:mm"
        let myDate = Date(timeIntervalSince1970: self)
        let dateString = formatter.string(from: myDate)
        return dateString
    }
}
