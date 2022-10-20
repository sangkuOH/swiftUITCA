//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

import ComposableArchitecture
import TDependency


public struct Root: ReducerProtocol {
  @Dependency(\.rootEnvironment) var rootEnvironment
  public init() {}
}
