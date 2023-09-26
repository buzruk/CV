//
//  InterestsView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct InterestsView: View {
  let viewModel: InterestsViewModel

  var body: some View {
    TagView(items: viewModel.items.map(\.name))
  }
}

#Preview {
  InterestsView(viewModel: InterestsViewModel(interests: Person.me.interests))
}
