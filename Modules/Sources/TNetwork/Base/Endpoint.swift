//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/20.
//
import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }

    var host: String {
        return "wordsapiv1.p.rapidapi.com"
    }
}
