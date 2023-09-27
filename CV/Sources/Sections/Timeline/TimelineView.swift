//
//  TimelineView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct TimelineView: View {
  private enum Constant {
    static let timelineStrokeWidth: CGFloat = 4
    static let timelineDotSize = CGSize(width: 22, height: 22)
  }

  let viewModel: TimelineViewModel

  var body: some View {
    ZStack {
      VStack(spacing: .cvSemiLargeSpacing) {
        ForEach(viewModel.sections) { section in
          if section == viewModel.sections.last {
            TimelineSectionView(viewModel: section)
              .anchorPreference(
                key: TimelineDotPreferenceKey.self,
                value: .bounds
              ) { $0 }
          } else {
            TimelineSectionView(viewModel: section)
          }
        }
      }
    }
    .overlayPreferenceValue(TimelineDotPreferenceKey.self) { preferences in
      GeometryReader { geometry in
        preferences.map { anchor in
          timelineStroke
            .frame(height: geometry.size.height - geometry[anchor].height)
            .offset(
              x: Constant.timelineDotSize.width / 2 - Constant.timelineStrokeWidth / 2,
              y: Constant.timelineDotSize.height / 2
            )
        }
      }
    }
  }

  private var timelineStroke: some View {
    Rectangle()
      .fill(Color.accentColor)
      .frame(width: Constant.timelineStrokeWidth)
  }

  private struct TimelineSectionView: View {
    let viewModel: TimelineViewModel.Section

    var body: some View {
      HStack(alignment: .titleAndTimelineRectangle, spacing: .cvExtraLargeSpacing) {
        timelineDot

        VStack(alignment: .leading, spacing: .cvSmallSpacing) {
          title

          items
        }
      }
    }

    private var timelineDot: some View {
      RoundedRectangle(cornerRadius: .cvSmallCornerRadius, style: .continuous)
        .fill(Color.accentColor)
        .frame(width: Constant.timelineDotSize.width, height: Constant.timelineDotSize.height)
        .alignmentGuide(.titleAndTimelineRectangle) { dimension in
          dimension[VerticalAlignment.center]
        }
    }

    private var title: some View {
      Text(viewModel.title)
        .font(.title2)
        .bold()
        .foregroundColor(.cvPrimary)
        .alignmentGuide(.titleAndTimelineRectangle) { dimension in
          dimension[VerticalAlignment.center]
        }
    }

    private var items: some View {
      ForEach(viewModel.items) { item in
        TimelineItemView(viewModel: item)
      }
    }
  }

  private struct TimelineItemView: View {
    let viewModel: TimelineViewModel.Item
    #if os(iOS)
      @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    var body: some View {
      VStack(alignment: .leading, spacing: .cvSmallSpacing) {
        #if os(iOS)
          if horizontalSizeClass == .compact {
            summary
            DateView(date: viewModel.timeframe)
          } else {
            summary
          }
        #else
          summary
        #endif

        if !viewModel.info.isEmpty {
          infoItems
        }
      }
    }

    private var summary: some View {
      HStack {
        Text(viewModel.title)
          .font(.title3)
          .foregroundColor(.cvPrimary)

        if let additionalTitle = viewModel.additionalTitle {
          Text("•")
            .font(.title3)
            .foregroundColor(.accentColor)

          Text(additionalTitle.content)
            .font(.title3)
            .foregroundColor(.cvSecondary)
            .accessibilityLabel(additionalTitle.spokenContent)
        }

        Spacer()

        #if os(iOS)
          if horizontalSizeClass == .regular {
            DateView(date: viewModel.timeframe)
          }
        #else
          DateView(date: viewModel.timeframe)
        #endif
      }
    }

    private var infoItems: some View {
      VStack(alignment: .leading, spacing: .cvExtraSmallSpacing) {
        ForEach(viewModel.info, id: \.self.content) { info in
          Text(info.formattedContent)
            .font(.callout)
            .padding(5)
            .foregroundColor(.cvSecondary)
            .accessibilityLabel(info.content)
        }
      }
    }
  }
}

struct TimelineDotPreferenceKey: PreferenceKey {
  typealias Value = Anchor<CGRect>?

  static var defaultValue: Value = nil

  static func reduce(
    value: inout Value,
    nextValue: () -> Value
  ) {
    value = nextValue()
  }
}

private extension VerticalAlignment {
  struct TitleAndTimelineRectangle: AlignmentID {
    static func defaultValue(in dimension: ViewDimensions) -> CGFloat {
      dimension[VerticalAlignment.center]
    }
  }

  static let titleAndTimelineRectangle = VerticalAlignment(TitleAndTimelineRectangle.self)
}

#Preview {
//  TimelineView(viewModel: TimelineViewModel(educationalBackground: Person.me.educationalBackground))

  TimelineView(viewModel: TimelineViewModel(projects: Person.me.projects))
}
