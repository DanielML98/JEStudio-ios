//
//  DataManager.swift
//  JE Studio
//
//  Created by Daniel Martínez on 10/07/22.
//

import Foundation
import FirebaseDatabase

class DataManager {
  var database: DatabaseReference!
  init() {
    database = Database.database().reference()
  }
  func getSessions(for studio: SpinningStudio, completion: @escaping (Result<[Session], Error>) -> Void) {
    database.child(studio.rawValue).getData { error, data in
      guard let sessions = data?.value as? [String : Any] else { return }
      do {
        let data =  try JSONSerialization.data(withJSONObject: sessions, options: .prettyPrinted)
        let sessionsDictionary = try JSONDecoder().decode([String:Session].self, from: data)
        let sessionsArray: [Session] = sessionsDictionary.values.map { $0 }.sorted { session1, session2 in
          session1.id < session2.id
        }
        completion(.success(sessionsArray))
      } catch {
        completion(.failure(error))
      }
    }
  }
  
  func bookPlaceIn(session: Session, updatedParticipants: [String:Int], completion: @escaping (Result<String, Error>) -> Void) {
    database.child(session.studio).child(session.id).child("participants").setValue(updatedParticipants) { error, data in
      guard error == nil
      else {
        completion(.failure(error!)) // Used force unwrapping since line 32 already checks that an error exists, inside this else there's always an error
        return
      }
      completion(.success(data.url))
    }
  }
}

enum SpinningStudio: String {
  case moderna
  case universidad
}
