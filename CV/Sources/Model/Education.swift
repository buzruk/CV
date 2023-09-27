//
//  Education.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

protocol Graduation {
  var finalGrade: Float { get }
}

struct Education: PeriodOfLife {
  enum Degree {
    case bachelor(graduation: UniversityGraduation?)

    struct UniversityGraduation: Graduation {
      let finalGrade: Float
    }
  }

  let institutionName: String
  let city: String
  let startDate: Date
  let endDate: Date?
  let seekedDegree: Degree
  let programOfStudy: String?
}
