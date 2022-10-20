//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//
import TCommon
import TNetwork
import ComposableArchitecture

extension Root {
  public enum Action: BindableAction {
    case binding(BindingAction<State>)
    case sendWord
    case sendWordResult(Result<SimilarTo, RequestError>)
  }
}
