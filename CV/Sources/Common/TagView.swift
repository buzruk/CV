//
//  TagView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct TagView: View {
  let items: [String]

  var body: some View {
    FlowLayout(alignment: .leading, spacing: .cvSemiSmallSpacing) {
      ForEach(items, id: \.self) { item in
        Item(title: item)
      }
    }
  }

  private struct Item: View {
    let title: String

    var body: some View {
      Text(title)
        .padding([.leading, .trailing], .cvMediumSpacing)
        .padding([.top, .bottom], .cvSmallSpacing)
        .font(.footnote)
        .foregroundColor(.cvPrimary)
        .background(
          Capsule(style: .continuous)
            .fill(Color.cvBackground)
            .shadow(color: .cvShadow, radius: 2)
        )
    }
  }
}

struct TagView_Previews: PreviewProvider {
  static var previews: some View {
    TagView(items: Person.me.interests)
      .frame(width: 330)
      .previewLayout(.sizeThatFits)
  }
}
