//
//  File.swift
//  
//
//  Created by Alex Galonsky on 7/23/23.
//

import Foundation

struct ParsedEvent {
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
