//
//  EventView.swift
//  HACOHub
//
//  Created by AsaokaTakuya on 2025/10/05.
//

import SwiftUI
import MapKit

struct EventPin: Identifiable {
  let id = UUID()
  let imageName: String
  let width: CGFloat
  let height: CGFloat
  let position: CGPoint
}

struct LegendItem: Identifiable {
  let id = UUID()
  let imageName: String
  let width: CGFloat
  let height: CGFloat
  let label: String
  let color: Color
}

func getIconNames(features: [EventFeature]) -> [EventIcon] {
  return features.map { feature in
    switch feature {
      case .ticket:
        return EventIcon.ticket
      case .bagStorage:
        return EventIcon.bagStorage
      case .food:
        return EventIcon.food
      case .vip:
        return EventIcon.vip
      case .goods:
        return EventIcon.goods
    }
  }
}

struct EventView: View {
  @State private var selectedEvent: EventInfo?
  @StateObject private var locationManager = LocationManager()

  @State private var searchText: String = ""
  @State private var position: MapCameraPosition = .automatic
  @State private var destinations: [CLLocationCoordinate2D] = [
    CLLocationCoordinate2D(latitude: 33.754389, longitude: -84.400480),
    CLLocationCoordinate2D(latitude: 33.760428, longitude: -84.392871),
    CLLocationCoordinate2D(latitude: 33.756854, longitude: -84.377670),
    CLLocationCoordinate2D(latitude: 33.767718, longitude: -84.381642),
    CLLocationCoordinate2D(latitude: 33.764846, longitude: -84.392317),
  ]
  @State private var isShowingEventMap = false

  @State var modalPosition = CGSize.zero

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if let currentLocation = locationManager.currentLocation {
          Map(position: $position) {
            ForEach(Array(destinations.enumerated()), id: \.offset) { index, dest in
              Annotation("", coordinate: dest) {
                Button {
                  isShowingEventMap = true
                } label: {
                  Image("DestinationPin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 41.81, height: 52.25)
                }
                .accessibilityHidden(true)
              }
            }
            Annotation("", coordinate: currentLocation) {
              Image("CurrentLocationPin")
                .resizable()
                .scaledToFit()
                .frame(width: 26.25, height: 37.5)
                .accessibilityHidden(true)
            }
          }
          .onReceive(locationManager.$currentLocation) { coordinate in
            guard let coordinate = coordinate else { return }

            if position == .automatic {
              let offsetLatitude = coordinate.latitude - 0.008
              let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: offsetLatitude, longitude: coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
              )
              position = .region(region)
            }
          }

          VStack {
            HStack {
              SquareIconButton(iconName: "HomeIcon", length: 46, action: {})
              SearchBar(text: $searchText)
            }
            .padding(.horizontal, 20)
            Spacer()
          }

          HalfModalView(position: $modalPosition, viewSize: geometry.size) {modalState in
            ModalContentView(selectedEvent: $selectedEvent, modalState: modalState)
          }
          .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: -2)
        } else {
          ProgressView("Getting current location…")
        }
      }
      // TODO: これ不要じゃない？
//      .navigationBarBackButtonHidden(false)
//      .toolbarBackground(.hidden, for: .navigationBar)
      .navigationDestination(item: $selectedEvent) { _ in
        ReserveLockerView(selectedEvent: $selectedEvent)
      }
    }
  }
}

struct ModalContentView: View {
  @Binding var selectedEvent: EventInfo?
  let modalState: ModalState

  private func getScrollViewHeight(viewSize: CGSize) -> CGFloat {
    switch modalState {
      // TODO: マジックナンバーなので直したい。HalfModalの高さの割合をコンテナの高さと設定してスクロールが効くようにしている。
    case .high: return viewSize.height * 0.94
    case .middle: return viewSize.height * 0.46
    case .low: return viewSize.height * 0.12
    }
  }

  var body: some View {
    VStack(spacing: 25) {
      HStack(alignment: .bottom) {
        Text.sfProBold("Nearby Events", size: 20)
        Spacer()
        HStack {
          Text.sfProBold("Sort", size: 16)
          Image("InvertedTriangle")
            .resizable()
            .scaledToFit()
            .frame(width: 10, height: 8)
            .offset(y: 1)
        }
      }
      .padding(.trailing, 16)

      GeometryReader { geometry in
        ScrollView {
          LazyVStack(spacing: 18) {
            ForEach(events) { event in
              Button {
                self.selectedEvent = event
              } label: {
                EventListView(
                  title: event.title,
                  imageName: event.imageName,
                  date: event.date,
                  time: event.time,
                  features: event.features,
                  availableLockers: event.availableLockers,
                  totalLockers: event.totalLockers,
                )
              }
              .buttonStyle(PlainButtonStyle())
              Divider()
                .background(getRGBColor(205, 205, 205))
            }
          }
          .padding(.trailing, 16)
        }
        .frame(height: getScrollViewHeight(viewSize: geometry.size))
        .frame(maxWidth: .infinity)
      }
    }
  }
}

struct EventIconView: View {
  let iconNames: [EventIcon]

  var body: some View {
    HStack(spacing: 4) {
      ForEach(iconNames, id: \.self) { iconNames in
        Image(iconNames.rawValue)
          .resizable()
          .scaledToFit()
          .frame(width: 24, height: 24)
      }
    }
  }
}

struct EventListView: View {
  let title: String
  let imageName: String
  let date: String
  let time: String
  let features: [EventFeature]
  let availableLockers: Int
  let totalLockers: Int

  var body: some View {
    VStack(alignment: .leading) {
      Text.sfProBold(title, size: 16)
      HStack {
        VStack(alignment: .leading) {
          Text.sfProRegular("\(date) \(time)", size: 16)
          EventIconView(iconNames: getIconNames(features: features))
          Text.sfProRegular(makeStyledText(for: availableLockers, total: totalLockers))
        }
        Spacer()
        Image(imageName)
          .resizable()
          .scaledToFit()
          .frame(width: 112, height: 74)
      }
    }
  }

  func makeStyledText(for available: Int, total: Int) -> AttributedString {
    var string = AttributedString("Available Lockers: \(available)/\(total)")

    if let slashRange = string.range(of: "/") {
      let endRange = slashRange.lowerBound..<string.endIndex
      string[endRange].font = .system(size: 13, weight: .regular)
    }

    if let prefixRange = string.range(of: "Available Lockers:") {
      string[prefixRange].font = .system(size: 16, weight: .regular)
    }

    return string
  }
}

#Preview {
    EventView()
}
