//
//  Person.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

struct Person {
  let name: String
  let gender: Gender
  let role: String
  let imageName: String
  let birthday: Date
  let nationality: String
  let address: Address
  let contactInfo: ContactInfo
  let jobs: [Job]
  let projects: [Project]
  let educationalBackground: [Education]
  let skills: [[Skill]]
  let interests: [Interest]
}

extension Person {
  struct Address {
    let street: String
    let zip: String
    let city: String
    let country: String
  }
}

extension Person {
  struct ContactInfo {
    let phoneNumber: String
    let email: String
    let website: URL
  }
}

extension Person {
  enum Gender {
    case male
    case female
  }
}
