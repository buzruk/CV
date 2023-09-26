//
//  TrainingView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct TrainingsView: View {
  let viewModel: TrainingsViewModel

  var body: some View {
    VStack(alignment: .leading) {
      ForEach(viewModel.items) { item in
        Item(viewModel: item)
      }
    }
  }

  private struct Item: View {
    let viewModel: TrainingsViewModel.Item

    var body: some View {
      VStack(alignment: .leading, spacing: .cvSemiSmallSpacing) {
        HStack {
          Text(viewModel.name)
            .font(.title)
            .foregroundColor(.cvPrimary)
          Spacer()
          DateView(date: viewModel.year)
        }
        .accessibilityElement(children: .combine)

        ForEach(viewModel.info, id: \.self.content) { info in
          Text(info.formattedContent)
            .font(.headline)
            .foregroundColor(.cvSecondary)
            .accessibilityLabel(info.content)
        }
      }
      .accessibilityElement(children: .contain)
    }
  }
}

#Preview {
  TrainingsView(viewModel: TrainingsViewModel(trainings: Person.me.trainings))
    .previewLayout(.sizeThatFits)
}
