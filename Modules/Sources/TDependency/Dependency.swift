//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

import ComposableArchitecture

public enum EnvironmentKey: DependencyKey {
  public static let liveValue = RootEnvironment()
}

public extension DependencyValues {
  var rootEnvironment: RootEnvironment {
    get { self[EnvironmentKey.self] }
    set { self[EnvironmentKey.self] = newValue }
  }
}

public struct RootEnvironment {
  public init() {}
}
