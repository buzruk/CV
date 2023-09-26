//
//  Skill.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

protocol Skill {
  var name: String { get }
}

struct BasicSkill: Skill {
  let name: String
}

struct PercentageSkill: Skill {
  let name: String
  let relativeExperience: Float
}
