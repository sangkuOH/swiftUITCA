//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

import ComposableArchitecture
import TNetwork

public enum WordServiceKey: DependencyKey {
  public static let liveValue: WordService = WordServiceLive()
  public static let previewValue: WordService = WordServiceMock()
}

public extension DependencyValues {
  var wordService: WordService {
    get { self[WordServiceKey.self] }
    set { self[WordServiceKey.self] = newValue }
  }
}
