//
//  InfoViewModel.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

struct InfoViewModel: Equatable {
  let bulletPoint: String
  let content: String

  var formattedContent: String {
    "\(bulletPoint)  \(content)"
  }
}
