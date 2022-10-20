//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

import ComposableArchitecture
import TCommon

extension Root {
  public struct State: Equatable {
    @BindableState var text: String
    var similarTo: SimilarTo

    public init(
      text: String = "",
      similarTo: SimilarTo = .init()
    ) {
      self.text = text
      self.similarTo = similarTo
    }
  }
}
