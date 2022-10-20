//
//  SwiftUIView.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

import ComposableArchitecture
import SwiftUI

public struct RootView: View {
  @ObservedObject
  private var viewStore: RootViewStore

  private let store: RootStore

  public init(store: RootStore) {
    self.store = store
    self.viewStore = .init(store)
  }

  public var body: some View {
    VStack {
      TextField
        .init(
          "동의어를 찾을 수 있습니다.",
          text: viewStore.binding(\.$text)
        )
        .onSubmit {
          viewStore.send(.sendWord)
        }
      List {
        ForEach(viewStore.similarTo.similarTo, id: \.self) { item in
          Text(item)
        }
      }
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView
      .init(
        store: .init(
          initialState: .init(),
          reducer: Root()
        )
      )
  }
}

// MARK: Store

public typealias RootStore = Store<
  Root.State,
  Root.Action
>

// MARK: ViewStore

public typealias RootViewStore = ViewStore<
  Root.State,
  Root.Action
>
