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
    FlowLayout(alignment: .topLeading) {
      ForEach(self.items, id: \.self) { item in
        Item(title: item)
      }
    }
  }

  private struct Item: View {
    let title: String

    var body: some View {
      Text(self.title)
        .padding([.leading, .trailing], .cvMediumSpacing)
        .padding([.top, .bottom], .cvSmallSpacing)
        .font(.footnote)
        .foregroundColor(.cvPrimary)
        .background(
          Capsule(style: .continuous)
            .fill(Color.cvShadow)
            .shadow(color: .cvShadow, radius: 2)
        )
    }
  }
}

#Preview {
  TagView(items: Person.me.interests)
}
