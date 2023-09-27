//
//  SkillsView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct SkillsView: View {
  let viewModel: SkillsViewModel

  var body: some View {
    VStack(alignment: .leading, spacing: .cvSemiLargeSpacing) {
      ForEach(viewModel.percentageSkills) { percentageSkills in
        SkillsPercentView(viewModel: percentageSkills)
      }

      TagView(items: viewModel.basicSkills.items.map(\.name))
    }
  }

  private struct SkillsPercentView: View {
    let viewModel: SkillsViewModel.Percentage

    var body: some View {
      VStack {
        ForEach(viewModel.items) { item in
          SkillsPercentItemView(viewModel: item)
        }
      }
      .padding(.cvMediumSpacing)
      .font(.footnote)
      .foregroundColor(.cvPrimary)
      .background(
        RoundedRectangle(cornerRadius: .cvSmallCornerRadius, style: .continuous)
          .fill(Color.cvBackground)
          .shadow(color: .cvShadow, radius: 5)
      )
    }

    private struct SkillsPercentItemView: View {
      let viewModel: SkillsViewModel.Percentage.Item

      var body: some View {
        VStack(alignment: .leading, spacing: .cvSmallSpacing) {
          Text(viewModel.name)
            .font(.footnote)
            .foregroundColor(.cvPrimary)
          ProgressView(value: viewModel.percentCompleted)
            .tint(.accentColor)
            .background(Color.accentColor.opacity(0.3))
        }
      }
    }
  }
}

#Preview {
  SkillsView(viewModel: SkillsViewModel(skills: Person.me.skills))
    .padding()
    .previewLayout(.fixed(width: 300, height: 500))
}
