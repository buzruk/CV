//
//  DateFormatter+Extension.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

extension DateFormatter {
  static let monthNameAndYear: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter
  }()

  static let year: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
  }()
}
