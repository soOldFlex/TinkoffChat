//
//  Date.swift
//  TinkoffChat
//
//  Created by Рут on 30.09.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

extension Date {
    static func dateFromCustomString(_ customString: String) -> Date {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/mm/yyyy"
        return dateFormater.date(from: customString) ?? Date()
    }
    
    static func getDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/mm/yyyy"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
