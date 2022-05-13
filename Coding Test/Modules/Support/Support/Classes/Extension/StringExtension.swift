//
//  StringExtension.swift
//  News
//
//  Created by Savvycom on 11/05/2022.
//

import Foundation

public extension String {
    func date(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
