//
//  WarqLogEvent.swift
//  warqLog
//
//  Created by Josep Escobar on 24/10/2019.
//  Copyright © 2019 Josep Escobar. All rights reserved.
//

import Foundation

enum WarqLogEvent: String {
    case error = "[‼️ERROR]"
    case info = "[ℹ️INFO]"
    case debug = "[🔵DEBUG]"
    case verbose = "[✳️VERBOSE]"
    case warning = "[⚠️WARNING]"
    case fatalError = "[🛑FATAL ERROR]"
}
