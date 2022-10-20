//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/20.
//
import TCommon

public protocol WordService {
  func getSimilarTo(word: String) async -> Result<SimilarTo, RequestError>
}

public struct WordServiceLive: HTTPClient, WordService {
  public init() {
  }

  public func getSimilarTo(word: String) async -> Result<SimilarTo, RequestError> {
    await sendRequest(endpoint: WordEndpoint.words(word), responseModel: SimilarTo.self)
  }
}

public struct WordServiceMock: WordService {
  public init() {
  }

  public func getSimilarTo(word: String) async -> Result<SimilarTo, RequestError> {
    .success(.init(word: word, similarTo: ["mocking data"]))
  }
}
