//
//  DateView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct DateView: View {
  let date: String

  var body: some View {
    Text(date)
      .padding([.leading, .trailing], .cvMediumSpacing)
      .padding([.top, .bottom], .cvSmallSpacing)
      .font(.footnote)
      .foregroundColor(.cvPrimary)
      .background(
        RoundedRectangle(cornerRadius: .cvSmallCornerRadius, style: .continuous)
          .fill(Color.cvShadow)
          .shadow(color: .cvShadow, radius: 2)
      )
  }
}

#Preview {
  DateView(date: "Today")
    .padding()
    .previewLayout(.sizeThatFits)
}
