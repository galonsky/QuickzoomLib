//
//  File.swift
//  
//
//  Created by Alex Galonsky on 7/23/23.
//

import Foundation
import EventKit

public struct ParsedEvent : Codable, Hashable, Equatable, Comparable {
    var title: String
    var url: String
    var startDate: Date
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
    
    public static func == (lhs: ParsedEvent, rhs: ParsedEvent) -> Bool {
        return lhs.title == rhs.title && lhs.url == rhs.url && lhs.startDate == rhs.startDate
    }
    
    public static func < (lhs: ParsedEvent, rhs: ParsedEvent) -> Bool {
        return lhs.startDate < rhs.startDate
    }
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
