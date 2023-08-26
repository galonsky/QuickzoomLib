import Foundation
import EventKit

public enum NoAccessError: Error {
    case runtimeError
}

public class EventFetcher {
    var store: EKEventStore
    var granted: Bool
    var denied: Bool
    
    public init(store: EKEventStore = EKEventStore(), granted: Bool = false, denied: Bool = false) {
        self.store = store
        self.granted = granted
        self.denied = denied
    }
    
    public func getEvents() throws -> [EKEvent]? {
        while(!self.granted) {
            if (self.denied) {
                throw NoAccessError.runtimeError
            }
            sleep(1)
        }
        
        // Get the appropriate calendar.
        let calendar = Calendar.current

        // Create the start date components
        var oneHourAgoComponents = DateComponents()
        oneHourAgoComponents.hour = -1
        let oneHourAgo = calendar.date(byAdding: oneHourAgoComponents, to: Date(), wrappingComponents: false)

        // Create the end date components.
        var oneDayFromNowComponents = DateComponents()
        oneDayFromNowComponents.day = 1
        let oneDayFromNow = calendar.date(byAdding: oneDayFromNowComponents, to: Date(), wrappingComponents: false)

        // Create the predicate from the event store's instance method.
        var predicate: NSPredicate? = nil
        if let anAgo = oneHourAgo, let aNow = oneDayFromNow {
            predicate = store.predicateForEvents(withStart: anAgo, end: aNow, calendars: nil)
        }

        // Fetch all events that match the predicate.
        var events: [EKEvent]? = nil
        if let aPredicate = predicate {
            events = store.events(matching: aPredicate)
            return events
        }
        return events
    }
    
    public func requestAccess() {
        store.requestAccess(to: .event, completion: {(accessGranted: Bool, error: Error?) in
            if (!accessGranted) {
                self.denied = true
            }
            self.granted = accessGranted
        })
    }
}
