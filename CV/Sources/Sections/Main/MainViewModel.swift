//
//  MainViewModel.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

final class MainViewModel: ObservableObject {
  let header: HeaderViewModel
  let timelines: [TimelineViewModel]
  let skills: SkillsViewModel
  let trainings: TrainingsViewModel
  let interests: InterestsViewModel

  @Published var isSnapshotting = false
  @Published var shareURL: URL?

  init(person: Person) {
    self.header = HeaderViewModel(person: person)
    self.timelines = [
      TimelineViewModel(jobs: person.jobs),
      TimelineViewModel(educationalBackground: person.educationalBackground),
    ]
    self.skills = SkillsViewModel(skills: person.skills)
    self.trainings = TrainingsViewModel(trainings: person.trainings)
    self.interests = InterestsViewModel(interests: person.interests)
  }
}
