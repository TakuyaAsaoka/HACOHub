//
//  SearchBar.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import SwiftUI

struct SearchBar: View {
  @Binding var text: String

  var body: some View {
    ZStack {
      HStack {
        Image(systemName: "magnifyingglass")
          .foregroundColor(getRGBColor(110, 119, 129))
          .font(.system(size: 20))
        TextField("Search for events", text: $text)
          .foregroundColor(getRGBColor(110, 119, 129))
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 13)
      .background(Color.white)
      .cornerRadius(29)
      .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
    }
  }
}

#Preview {
  @Previewable @State var searchText = ""
  return SearchBar(text: $searchText)
}
