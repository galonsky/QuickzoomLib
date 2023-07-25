//
//  File.swift
//  
//
//  Created by Alex Galonsky on 7/25/23.
//

import Foundation

public struct AlfredItem : Codable {
    var title: String
    var subtitle: String
    var arg: String
}

public struct AlfredItems : Codable {
    var items: [AlfredItem]
}

func eventToAlfredItem(event: ParsedEvent) -> AlfredItem {
    return AlfredItem(
        title: event.title,
        subtitle: event.startDate.ISO8601Format(),
        arg: event.url
    )
}

public func serializeForAlfred(events: [ParsedEvent]) throws -> String {
    let encoder = JSONEncoder()
    let items = AlfredItems(items: events.map {eventToAlfredItem(event: $0)})
    let data = try encoder.encode(items)
    return String(data: data, encoding: .utf8)!
}
