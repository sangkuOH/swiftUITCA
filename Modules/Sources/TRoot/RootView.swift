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
      Text(viewStore.text)
      Text("\(viewStore.count)")
      Button {
        viewStore.send(.tappedButton)
      } label: {
        Text("Button")
      }
      .buttonStyle(.borderedProminent)
    }
    .task {
      viewStore.send(.onAppear)
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
