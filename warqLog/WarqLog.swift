//
//  WarqLog.swift
//  warqLog
//
//  Created by Josep Escobar on 24/10/2019.
//  Copyright © 2019 Josep Escobar. All rights reserved.
//

import Foundation

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

    private static func logThis(_ event: WarqLogEvent, _ filename: String, _ line: Int, _ column: Int, _ funcName: String, _ object: Any?) {
        if isLoggingEnabled {
            print("\(Date().warqLogToString()) \(event.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object ?? "nil value provided")")
        }
    }

    private static func logThis(_ event: WarqLogEvent, withTag tag: String, _ filename: String, _ line: Int, _ column: Int, _ funcName: String, _ object: Any?) -> String? {
        if isLoggingEnabled {
            let output = "\(Date().warqLogToString()) \(event.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) \(tag.uppercased()) -> \(object ?? "nil value provided")"
            print(output)
            return output
        }
        return nil
    }

    private static func logThis(_ event: WarqLogEvent, encloseInTag tag: String, _ filename: String, _ line: Int, _ column: Int, _ funcName: String, _ object: Any?) {
        if isLoggingEnabled {
            print("╒═══════════ START: " + tag.uppercased() + " ═══════════╕")
            logThis(event, filename, line, column, funcName, object)
            print("╘════════════ END: " + tag.uppercased() + " ════════════╛\n")
        }
    }

    private class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }

    // MARK: - INFO

    /// Used to show Info on console
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func info(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.info, filename, line, column, funcName, object)
    }

    /// Used to show Info on console and enclose to log block based on your Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print and enclose to log block
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func info(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.info, encloseInTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Info on console with Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func info(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(WarqLogEvent.info, withTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Info on console with Tag and returns logged string
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    /// - Returns: Logged String
    public static func info(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(WarqLogEvent.info, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - DEBUG

    /// Used to show Debug information on console
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func debug(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.debug, filename, line, column, funcName, object)
    }

    /// Used to show Debug information on console and enclose to log block based on your Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func debug(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.debug, encloseInTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Debug information on console with Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func debug(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(WarqLogEvent.debug, withTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Debug information on console with Tag and returns logged string
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    /// - Returns: Logged String
    public static func debug(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return  logThis(WarqLogEvent.debug, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - VERBOSE

    /// Used to show Verbose log on console
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func verbose(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.verbose, filename, line, column, funcName, object)
    }

    /// Used to show Verbose log on console and enclose to log block based on your Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print and enclose to log block
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func verbose(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.verbose, encloseInTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Verbose log  on console with Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func verbose(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(WarqLogEvent.verbose, withTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Verbose log on console with Tag and returns logged string
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    /// - Returns: Logged String
    public static func verbose(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(WarqLogEvent.verbose, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - WARNING

    /// Used to show warning log on console
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func warning(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.warning, filename, line, column, funcName, object)
    }

    /// Used to show warning log on console and enclose to log block based on your Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print and enclose to log block
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func warning(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.warning, encloseInTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show warning log on console with Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func warning(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(WarqLogEvent.warning, withTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show warning log on console with Tag and returns logged string
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    /// - Returns: Logged String
    public static func warning(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(WarqLogEvent.warning, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - ERROR
    /// Used to show Error log on console
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func error(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.error, filename, line, column, funcName, object)
    }

    /// Used to show Error log on console and enclose to log block based on your Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print and enclose to log block
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func error(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.error, encloseInTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Error log on console with Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func error(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(WarqLogEvent.error, withTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show Error log on console with Tag and returns logged string
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    /// - Returns: Logged String
    public static func error(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(WarqLogEvent.error, withTag: tag, filename, line, column, funcName, object) ?? ""
    }

    // MARK: - FATAL ERROR
    /// Used to show fatal error log on console
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func fatalError(_ object: Any?, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.fatalError, filename, line, column, funcName, object)
    }

    /// Used to show fatal error log on console and enclose to log block based on your Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print and enclose to log block
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func fatalError(_ object: Any?, encloseInTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        logThis(WarqLogEvent.fatalError, encloseInTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show fatal error log on console with Tag
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    public static func fatalError(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        _ = logThis(WarqLogEvent.fatalError, withTag: tag, filename, line, column, funcName, object)
    }

    /// Used to show fatal errror log on console with Tag and returns logged string
    /// - Parameter object: [Requiered] What you want to print
    /// - Parameter tag: [Requiered] Tag to identify your print
    /// - Parameter filename: [Optional] This method can infer the file
    /// - Parameter line: [Optional] This method can infer the line
    /// - Parameter column: [Optional] This method can infer the column
    /// - Parameter funcName: [Optional] This method can infer the function name
    /// - Returns: Logged String
    public static func fatalError(_ object: Any?, withTag tag: String, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) -> String {
        return logThis(WarqLogEvent.fatalError, withTag: tag, filename, line, column, funcName, object) ?? ""
    }
}
