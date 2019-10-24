//
//  WarqLog.swift
//  warqLog
//
//  Created by Josep Escobar on 24/10/2019.
//  Copyright © 2019 Josep Escobar. All rights reserved.
//

import Foundation

enum LogEvent: String {
    case error = "[‼️ERROR]"
    case info = "[ℹ️INFO]"
    case debug = "[🔵DEBUG]"
    case verbose = "[✳️VERBOSE]"
    case warning = "[⚠️WARNING]"
    case fatalError = "[🛑FATAL ERROR]"
}

public class WarqLog: NSObject {
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"

    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }

    static var isLoggingEnabled: Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

    private static func logThis(_ event: LogEvent, _ filename: String, _ line: Int, _ column: Int, _ funcName: String, _ object: Any?) {
        if isLoggingEnabled {
            print("\(Date().warqLogToString()) \(event.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object ?? "nil value provided")")
        }
    }

    private static func logThis(_ event: LogEvent, withTag tag: String, _ filename: String, _ line: Int, _ column: Int, _ funcName: String, _ object: Any?) -> String? {
        if isLoggingEnabled {
            let output = "\(Date().warqLogToString()) \(event.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) \(tag.uppercased()) -> \(object ?? "nil value provided")"
            print(output)
            return output
        }
        return nil
    }

    private static func logThis(_ event: LogEvent, encloseInTag tag: String, _ filename: String, _ line: Int, _ column: Int, _ funcName: String, _ object: Any?) {
        if isLoggingEnabled {
            print("╒═══════════ START: " + tag.uppercased() + " ═══════════╕")
            logThis(event, filename, line, column, funcName, object)
            print("╘════════════ END: " + tag.uppercased() + " ════════════╛\n")
        }
    }

    // MARK: - INFO
    public static func info(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.info, filename, line, column, funcName, object)
    }

    public static func info(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.info, encloseInTag: tag, filename, line, column, funcName, object)
    }

    public static func info(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(LogEvent.info, withTag: tag, filename, line, column, funcName, object)
    }
    
    public static func info(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(LogEvent.info, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - DEBUG
    public static func debug(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.debug, filename, line, column, funcName, object)
    }

    public static func debug(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.debug, encloseInTag: tag, filename, line, column, funcName, object)
    }

    public static func debug(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(LogEvent.debug, withTag: tag, filename, line, column, funcName, object)
    }
    
    public static func debug(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return  logThis(LogEvent.debug, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - VERBOSE
    public static func verbose(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.verbose, filename, line, column, funcName, object)
    }

    public static func verbose(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.verbose, encloseInTag: tag, filename, line, column, funcName, object)
    }

    public static func verbose(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(LogEvent.verbose, withTag: tag, filename, line, column, funcName, object)
    }
    
    public static func verbose(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(LogEvent.verbose, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - WARNING
    public static func warning(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.warning, filename, line, column, funcName, object)
    }

    public static func warning(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.warning, encloseInTag: tag, filename, line, column, funcName, object)
    }

    public static func warning(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(LogEvent.warning, withTag: tag, filename, line, column, funcName, object)
    }
    
    public static func warning(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(LogEvent.warning, withTag: tag, filename, line, column, funcName, object) ?? ""
    }
    
    // MARK: - ERROR
    public static func error(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.error, filename, line, column, funcName, object)
    }

    public static func error(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.error, encloseInTag: tag, filename, line, column, funcName, object)
    }

    public static func error(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(LogEvent.error, withTag: tag, filename, line, column, funcName, object)
    }
    
    public static func error(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(LogEvent.error, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - FATAL ERROR
    public static func fatalError(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.fatalError, filename, line, column, funcName, object)
    }

    public static func fatalError(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(LogEvent.fatalError, encloseInTag: tag, filename, line, column, funcName, object)
    }

    public static func fatalError(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(LogEvent.fatalError, withTag: tag, filename, line, column, funcName, object)
    }
    
    public static func fatalError(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(LogEvent.fatalError, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}
