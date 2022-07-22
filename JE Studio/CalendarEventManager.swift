//
//  CalendarEventManager.swift
//  JE Studio
//
//  Created by Daniel Martínez on 16/07/22.
//

import Foundation
import EventKit

final class CalendarEventManager {
  
  func saveEvent(date: Date, completion: @escaping (Result<Any, Error>) -> Void) {
    let eventStore : EKEventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
      
      if granted && (error == nil) {
        
        let event:EKEvent = EKEvent(eventStore: eventStore)
        
        event.title = "event_title".jeLocalized
        event.startDate = date
        event.endDate = event.startDate.addingTimeInterval(60*60)
        event.notes = "event_notes".jeLocalized
        event.addAlarm(EKAlarm(absoluteDate: date))
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
          try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
          completion(.failure(error))
        }
        completion(.success(String()))
      }
      else{
        completion(.failure(error!))
      }
    }
  }
}
