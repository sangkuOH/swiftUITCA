//
//  TCAarkApp.swift
//  TCAark
//
//  Created by  오상구 on 2022/10/19.
//

import SwiftUI
import TRoot

@main
struct TCAarkApp: App {
  var store: RootStore
  var viewStore: RootViewStore
  
  init() {
    let root: Root = .init()
    self.store = .init(
      initialState: .init(),
      reducer: root
    )
    self.viewStore = .init(store)
  }
  
    var body: some Scene {
        WindowGroup {
          RootView
            .init(store: store)
        }
    }
}
