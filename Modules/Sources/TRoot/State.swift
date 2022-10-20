//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/19.
//

extension Root {
  public struct State: Equatable {
    var text: String
    var count: Int
    
    public init(
      text: String = "",
      count: Int = 0
    ) {
      self.text = text
      self.count = count
    }
    
  }
}
