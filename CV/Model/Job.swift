//
//  Job.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

protocol PeriodOfLife {
  var startDate: Date { get }
  var endDate: Date? { get }
}

struct Job: PeriodOfLife {
  let companyName: String
  let startDate: Date
  let endDate: Date?
  let role: String
  let programmingLanguages: [ProgrammingLanguage]
  let info: [String]
}
