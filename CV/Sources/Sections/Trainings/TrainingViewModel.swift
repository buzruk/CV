//
//  TrainingViewModel.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

 import Foundation

struct TrainingsViewModel {
  let title: String
  let items: [Item]

  init(trainings: [Training]) {
    self.title = "Trainings & Conferences"
    let yearFormatter = DateFormatter.year
    self.items = trainings.map { training in
      Item(
        id: UUID().uuidString,
        name: training.name,
        year: yearFormatter.string(from: training.date),
        info: training.info.map { InfoViewModel(bulletPoint: ">", content: $0) }
      )
    }
  }
}

extension TrainingsViewModel {
  struct Item: Identifiable {
    let id: String
    let name: String
    let year: String
    let info: [InfoViewModel]
  }
}
