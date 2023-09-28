//
//  InterestsViewModel.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

struct InterestsViewModel {
  let title: String
  let items: [Item]

  init(interests: [Interest]) {
    self.title = "Interests"
    self.items = interests.map { Item(name: $0) }
  }
}

extension InterestsViewModel {
  struct Item {
    let name: String
  }
}
