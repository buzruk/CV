//
//  CVApp.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

@main
struct CVApp: App {
  var body: some Scene {
    WindowGroup {
      MainView(viewModel: MainViewModel(person: Person.me))
    }
  }
}
