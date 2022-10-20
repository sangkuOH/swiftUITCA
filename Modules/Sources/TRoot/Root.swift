//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

import ComposableArchitecture
import TDependency
import TCommon


public struct Root: ReducerProtocol {
  @Dependency(\.wordService) var wordService
  
  public init() {}
  
  public var body: some ReducerProtocol<State, Action> {
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .sendWord:
        let keyword = state.text
        return .run { send in
          let result = await wordService.getSimilarTo(word: keyword)
          await send(.sendWordResult(result))
        }
        
      case .sendWordResult(.success(let response)):
        state.similarTo = response
        return .none
        
      case .sendWordResult(.failure(let error)):
        dump(error)
        return .none
      }
    }
    BindingReducer()
  }
}
