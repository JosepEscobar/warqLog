//
//  DateExtensions.swift
//  warqLog
//
//  Created by Josep Escobar on 24/10/2019.
//  Copyright © 2019 Josep Escobar. All rights reserved.
//

import Foundation

extension Date {
    func warqLogToString() -> String {
        return WarqLog.dateFormatter.string(from: self as Date)
    }
}
