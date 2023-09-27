//
//  Mainview.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct MainView: View {
  @ObservedObject var viewModel: MainViewModel
  #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  #endif

  var body: some View {
    ScrollView {
      VStack(spacing: .cvExtraLargeSpacing) {
        HeaderView(viewModel: viewModel.header)
          .padding(.top, .zero)

        ForEach(viewModel.timelines) { timeline in
          Section(title: timeline.title) {
            TimelineView(viewModel: timeline)
          }
        }
        .padding(.bottom, .cvExtraLargeSpacing)

        #if os(iOS)
          if horizontalSizeClass == .compact {
            VStack(spacing: .cvExtraLargeSpacing) {
              Section(title: viewModel.skills.title) {
                SkillsView(viewModel: viewModel.skills)
              }

              VStack(alignment: .leading) {
                Section(title: viewModel.interests.title) {
                  InterestsView(viewModel: viewModel.interests)
                }
              }
            }
          } else {
            HStack(alignment: .top, spacing: .cvExtraLargeSpacing) {
              Section(title: viewModel.skills.title) {
                SkillsView(viewModel: viewModel.skills)
              }

              Spacer()

              VStack(alignment: .leading) {
                Section(title: viewModel.interests.title) {
                  InterestsView(viewModel: viewModel.interests)
                }
              }
            }
          }
        #else
          HStack(alignment: .top, spacing: .cvExtraLargeSpacing) {
            Section(title: viewModel.skills.title) {
              SkillsView(viewModel: viewModel.skills)
            }

            Spacer()

            VStack(alignment: .leading) {
              Section(title: viewModel.interests.title) {
                InterestsView(viewModel: viewModel.interests)
              }
            }
          }
        #endif
      }
      .padding(.cvExtraLargeSpacing)
    }
  }

  private struct Section<Content: View>: View {
    let title: String
    let content: () -> Content

    var body: some View {
      VStack(spacing: .cvSemiLargeSpacing) {
        Text(title)
          .font(.title)
          .foregroundColor(.cvTertiary)

        content()
      }
    }
  }
}

#Preview {
  MainView(viewModel: MainViewModel(person: .me))
}
