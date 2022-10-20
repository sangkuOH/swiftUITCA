//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/20.
//
public struct SimilarTo: Codable, Hashable {
  public let word: String
  public let similarTo: [String]
  
  public init(
    word: String = "",
    similarTo: [String] = []
  ) {
    self.word = word
    self.similarTo = similarTo
  }
}
