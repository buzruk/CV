//
//  Person+me.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import Foundation

extension Person {
  static let me = Person(
    name: "Buzurgmexr Sultonaliyev",
    gender: .male,
    role: "iOS Developer",
    imageName: "me",
    birthday: Date.from(day: 23, month: 9, year: 2001)!,
    nationality: "Tajik",
    address: Address(
      street: "Farobiy Str.",
      zip: "150100",
      city: "Fergana",
      country: "Uzbekistan"
    ),
    contactInfo: ContactInfo(
      phoneNumber: "+998 77 777 4367",
      email: "buzurgmexrs@gmail.com",
      website: URL(string: "https://buzruk.github.io/")!
    ),
    jobs: [],
    projects: [
      Project(
        name: "Calculator-iOS-Storyboard",
        startDate: Date.from(month: 5, year: 2023)!,
        endDate: nil,
        url: "https://github.com/buzruk/UIKit-Calculator",
        programmingLanguages: [.swift],
        info: [
          "iOS calculator's clone in UIKit Storyboard",
          "Project built in MVC design pattern",
          "In project used UIKit",
        ]
      ),
      Project(
        name: "iMusicClone",
        startDate: Date.from(month: 7, year: 2023)!,
        endDate: nil,
        url: "https://github.com/buzruk/iMusicClone",
        programmingLanguages: [.swift],
        info: [
          "iMusic has a built-in music library, covering the most popular artists, genres and hottest playlists. You can search for the artists, songs and playlists and listen to them",
          "Project built in Clean Swift (VIP) design pattern",
          "In project used UIKit and SwiftUI",
          "You can search music and add it to your library",
        ]
      ),
//      Project(
//        name: "Calculator-iOS-Storyboard",
//        url: "https://github.com/buzruk/UIKit-Calculator.git",
//        programmingLanguages: [.swift],
//        info: ["iOS calculator's clone in UIKit Storyboard"]
//      ),
    ],
    educationalBackground: [
            Education(
                institutionName: "Fergana Polytechnic Institute",
                city: "Fergana",
                startDate: Date.from(month: 9, year: 2019)!,
                endDate: Date.from(month: 6, year: 2023)!,
                seekedDegree: .bachelor(graduation: .init(finalGrade: 4)),
                programOfStudy: "Engineer Technologist"
            ),
    ],
    skills: [
      [
        PercentageSkill(name: "Swift", relativeExperience: 1.0),
        PercentageSkill(name: "SwiftUI", relativeExperience: 0.8),
        PercentageSkill(name: "UIKit", relativeExperience: 0.6),
      ],
      [
        PercentageSkill(name: "Tajik (native language)", relativeExperience: 1.0),
        PercentageSkill(name: "Uzbek", relativeExperience: 1.0),
        PercentageSkill(name: "English", relativeExperience: 0.5),
        PercentageSkill(name: "Russian", relativeExperience: 0.3),
      ],
      [
        BasicSkill(name: "TDD, Unit & UI Testing"),
        BasicSkill(name: "Xcode & SPM & CocoaPods"),
        BasicSkill(name: "3rd Party SDKs"),
        BasicSkill(name: "API(S) Integration"),
        BasicSkill(name: "SOLID, DRY, KISS"),
        BasicSkill(name: "Git, Github"),
        BasicSkill(name: "MVC & MVVM & Clean Swift (VIP)"),
      ],
    ],
    interests: [
      Interest("Open source projects"),
      Interest("Coding"),
      Interest("Artificial intelligence"),
      Interest("Machine learning "),
      Interest("Cyber security"),
      Interest("Teaching"),
      Interest("Traveling"),

    ]
  )
}
