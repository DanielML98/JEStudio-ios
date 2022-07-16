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
      
      if (granted) && (error == nil) {
        print("granted \(granted)")
        print("error \(error)")
        
        let event:EKEvent = EKEvent(eventStore: eventStore)
        
        event.title = "JE Spinning Studio session"
        event.startDate = date
        event.endDate = event.startDate.addingTimeInterval(60*60)
        event.notes = "Remember to stay hydrated and pay your class"
        event.addAlarm(EKAlarm(absoluteDate: date))
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
          try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
          print("failed to save event with error : \(error)")
          completion(.failure(error))
        }
        completion(.success(String()))
      }
      else{
        print("failed to save event with error : \(error) or access not granted")
        completion(.failure(error!))
      }
    }
  }
}
