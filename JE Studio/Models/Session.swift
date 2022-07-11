//
//  Session.swift
//  JE Studio
//
//  Created by Daniel Martínez on 10/07/22.
//

import Foundation

struct Session: Codable, Identifiable {
  var id: String {
    let firsLetterIdenfier = self.studio.lowercased().first
    let date = self.date.replacingOccurrences(of: "/", with: "")
    let hour = self.hour.replacingOccurrences(of: ":", with: "")
    return "\(firsLetterIdenfier ?? "a")\(date)\(hour)"
  }
  let studio: String
  let coach: String
  let date: String
  let hour: String
  let participants: [String:Int]
}
