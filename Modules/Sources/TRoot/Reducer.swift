//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//
import ComposableArchitecture

extension Root {
  public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .onAppear:
      state.text = "hello TCA world!"
      return .none
      
    case .tappedButton:
      state.count += 1
      return .none
    }
  }
}

