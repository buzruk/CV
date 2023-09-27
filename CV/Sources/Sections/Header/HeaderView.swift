//
//  HeaderView.swift
//  CV
//
//  Created by Buzurgmexr Sultonaliyev on 26/09/23.
//

import SwiftUI

struct HeaderView: View {
  let viewModel: HeaderViewModel

  #if os(iOS)
  @Environment(\.horizontalSizeClass) private var horizontalSizeClass
  #endif

  private let cornerShapeRectangle = RoundedRectangle(cornerRadius: .cvMediumCornerRadius, style: .continuous)

  var body: some View {
    #if os(iOS)
    if horizontalSizeClass == .compact {
      VStack {
        ProfileInfoView(viewModel: viewModel.profileInfo)
          .padding(.cvLargeSpacing)
          .frame(maxWidth: .infinity)
        ProfileImageView(imageName: viewModel.imageName)
          .frame(width: 150)
          .accessibilityLabel(viewModel.imageDescription)
          .padding(.bottom, 30)
      }
      .background(
        cornerShapeRectangle
          .fill(Color.cvBackground)
      )
      .clipShape(cornerShapeRectangle)
      .shadow(color: .cvShadow, radius: 15)
    } else {
      HStack {
        ProfileInfoView(viewModel: viewModel.profileInfo)
          .padding(.cvLargeSpacing)

        Spacer()

        ProfileImageView(imageName: viewModel.imageName)
          .frame(width: 150)
          .accessibilityLabel(viewModel.imageDescription)
      }
      .background(
        cornerShapeRectangle
          .fill(Color.cvBackground)
      )
      .clipShape(cornerShapeRectangle)
      .shadow(color: .cvShadow, radius: 15)
    }
    #else
    HStack {
      ProfileInfoView(viewModel: viewModel.profileInfo)
        .padding(.cvLargeSpacing)

              Spacer()

      ProfileImageView(imageName: viewModel.imageName)
        .frame(width: 150)
        .accessibilityLabel(viewModel.imageDescription)
    }
    .background(
      cornerShapeRectangle
        .fill(Color.cvBackground)
    )
    .clipShape(cornerShapeRectangle)
    .shadow(color: .cvShadow, radius: 15)
    #endif
  }

  private struct ProfileInfoView: View {
    let viewModel: HeaderViewModel.ProfileInfo

    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    var body: some View {
      #if os(iOS)
      if horizontalSizeClass == .compact {
        VStack(spacing: .cvLargeSpacing) {
          VStack(spacing: .cvSmallSpacing) {
            Text(viewModel.title)
              .font(.title2)
              .foregroundColor(.cvPrimary)
              
            Text(viewModel.subtitle)
              .font(.headline)
              .foregroundColor(.cvSecondary)
          }

          ProfileInfoGridView(viewModel: viewModel.gridItems)
        }
      } else {
        VStack(alignment: .leading, spacing: .cvLargeSpacing) {
          VStack(alignment: .leading, spacing: .cvSmallSpacing) {
            Text(viewModel.title)
              .font(.largeTitle)
              .foregroundColor(.cvPrimary)
              
            Text(viewModel.subtitle)
              .font(.title)
              .foregroundColor(.cvSecondary)
          }

          ProfileInfoGridView(viewModel: viewModel.gridItems)
        }
      }
      #else
      VStack(alignment: .leading, spacing: .cvLargeSpacing) {
        VStack(alignment: .leading, spacing: .cvSmallSpacing) {
          Text(viewModel.title)
            .font(.largeTitle)
            .foregroundColor(.cvPrimary)
            
          Text(viewModel.subtitle)
            .font(.title)
            .foregroundColor(.cvSecondary)
        }

        ProfileInfoGridView(viewModel: viewModel.gridItems)
      }
      #endif
    }
  }

  private struct ProfileInfoGridView: View {
    let viewModel: [HeaderViewModel.ProfileInfo.GridItem]

    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    var body: some View {
      #if os(iOS)
      if horizontalSizeClass == .compact {
        VStack(alignment: .leading) {
          ForEach(viewModel) { item in
            Item(viewModel: item)
              .padding(.vertical, 5)
          }
        }
      } else {
        VStack(alignment: .leading) {
          ForEach(viewModel) { item in
            Item(viewModel: item)
              .padding(.vertical, 5)
          }
        }
      }
      #else
        VStack(alignment: .leading) {
        ForEach(viewModel) { item in
          Item(viewModel: item)
        }
      }
      #endif
    }

    private struct Item: View {
      let viewModel: HeaderViewModel.ProfileInfo.GridItem

      #if os(iOS)
      @Environment(\.horizontalSizeClass) private var horizontalSizeClass
      #endif

      var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
          HStack(spacing: .cvMediumSpacing) {
            Image(systemName: viewModel.iconName)
              .font(.headline)
              .foregroundColor(.accentColor)
              

            VStack(alignment: .leading, spacing: .cvExtraSmallSpacing) {
              ForEach(viewModel.texts, id: \.self.content) { content, contentDescription in
                Text(content)
                  .padding(.vertical, 2)
                  .accessibilityLabel("\(contentDescription ?? ""): \(content)")
              }
            }
            .font(.caption)
            .foregroundColor(.cvPrimary)
          }
          

        } else {
          HStack(spacing: .cvMediumSpacing) {
            Image(systemName: viewModel.iconName)
              .font(.headline)
              .foregroundColor(.accentColor)
              

            VStack(alignment: .leading, spacing: .cvExtraSmallSpacing) {
              ForEach(viewModel.texts, id: \.self.content) { content, contentDescription in
                Text(content)
                  .padding(.vertical, 2)
                  .accessibilityLabel("\(contentDescription ?? ""): \(content)")
              }
            }
            .font(.headline)
            .foregroundColor(.cvPrimary)
          }
          
        }
        #else
        HStack(spacing: .cvMediumSpacing) {
          Image(systemName: viewModel.iconName)
            .font(.headline)
            .foregroundColor(.accentColor)
            

          VStack(alignment: .leading, spacing: .cvExtraSmallSpacing) {
            ForEach(viewModel.texts, id: \.self.content) { content, contentDescription in
              Text(content)
                .padding(.vertical, 2)
                .accessibilityLabel("\(contentDescription ?? ""): \(content)")
            }
          }
          .font(.headline)
          .foregroundColor(.cvPrimary)
        }
        

        #endif
      }
    }
  }

  private struct ProfileImageView: View {
    let imageName: String

    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    var body: some View {
      #if os(iOS)
      if horizontalSizeClass == .compact {
        Image(imageName)
          .resizable()
          .scaledToFill()
          .clipShape(Circle())
          .frame(width: 72, height: 72)
      } else {
        Image(imageName)
          .resizable()
          .aspectRatio(contentMode: .fill)
      }
      #else
      Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
      #endif
    }
  }
}

#Preview {
  HeaderView(viewModel: HeaderViewModel(person: .me))
    .padding()
    .previewLayout(.fixed(width: 800, height: 300))
}
