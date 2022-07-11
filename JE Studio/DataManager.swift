//
//  DataManager.swift
//  JE Studio
//
//  Created by Daniel Martínez on 10/07/22.
//

import Foundation
import FirebaseDatabase

class DataManager {
  var ref: DatabaseReference!
  init() {
    ref = Database.database().reference()
  }
  func getSessions(for studio: SpinningStudio, completion: @escaping (Result<[Session], Error>) -> Void) {
    ref.child(studio.rawValue).getData { error, data in
      guard let sessions = data?.value as? [String : Any] else { return }
      do {
        let data =  try JSONSerialization.data(withJSONObject: sessions, options: .prettyPrinted)
        let sessionsDictionary = try JSONDecoder().decode([String:Session].self, from: data)
        let sessionsArray: [Session] = sessionsDictionary.values.map { $0 }
        completion(.success(sessionsArray))
      } catch {
        completion(.failure(error))
      }
    }
  }
}

enum SpinningStudio: String {
  case moderna
  case universidad
}
