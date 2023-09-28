//
//  MainViewModel.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

final class MainViewModel: ObservableObject {
  let header: HeaderViewModel
  let timelines: [TimelineViewModel]
  let skills: SkillsViewModel
  let interests: InterestsViewModel

  init(person: Person) {
    self.header = HeaderViewModel(person: person)
    self.timelines = [
      TimelineViewModel(educationalBackground: person.educationalBackground),
      TimelineViewModel(projects: person.projects),
    ]
    self.skills = SkillsViewModel(skills: person.skills)
    self.interests = InterestsViewModel(interests: person.interests)
  }
}
