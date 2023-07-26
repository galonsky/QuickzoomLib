//
//  File.swift
//  
//
//  Created by Alex Galonsky on 7/23/23.
//

import Foundation
import EventKit

public struct ParsedEvent : Codable {
    var title: String
    var url: String
    var startDate: Date
}



func parseDescription(description: String) -> String? {
    let zoomUrlPattern = /https?:\/\/\w+\.zoom\.us\/j\/\d+(\?pwd=\w+)?/;
    if let match = description.firstMatch(of: zoomUrlPattern) {
        return String(match.0)
    }
    return nil
}

public func parseEvent(event: EKEvent) -> ParsedEvent? {
    if let url = parseDescription(description: event.notes ?? "") {
        return ParsedEvent(title: event.title, url: url, startDate: event.startDate)
    }
    return nil
}
