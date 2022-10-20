//
//  File.swift
//  
//
//  Created by  오상구 on 2022/10/20.
//

import Foundation

class NetworkLogger {
  static func log(request: URLRequest) {
    print("\n\n - - - - - - - - - - [[ URLRequest Log Start ]] - - - - - - - - - - \n")
    //        defer { print("\n - - - - - - - - - - [[ URLRequest Log End   ]] - - - - - - - - - - \n") }
    
    let urlAsString = request.url?.absoluteString ?? ""
    let urlComponents = URLComponents(string: urlAsString)
    let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
    let path = "\(urlComponents?.path ?? "")"
    let query = "\(urlComponents?.query ?? "")"
    let host = "\(urlComponents?.host ?? "")"
    
    var output = """
            \(urlAsString)
            \(method) \(path)?\(query) HTTP/1.1
            HOST: \(host)\n
            """
    
    output += "\n-- Request Header --\n"
    for (key,value) in request.allHTTPHeaderFields ?? [:] {
      output += "\(key): \(value) \n"
    }
    
    output += "\n-- Request Body --\n"
    if let body = request.httpBody {
      if let bodyStr = String(data: body, encoding: .utf8) {
        output += "\(bodyStr)"
      } else {
        output += "\(body)"
      }
    } else {
      output += "NONE"
    }
    output += "\n"
    
    print(output)
  }
  
  static func log(response: HTTPURLResponse?, data: Data?, error: Error? = nil) {
    print("\n\n - - - - - - - - - - [[ URLResponse Log Start ]] - - - - - - - - - - \n")
//    defer { print("\n - - - - - - - - - -  END - - - - - - - - - - \n") }
    
    let urlString = response?.url?.absoluteString
    let components = NSURLComponents(string: urlString ?? "")
    let path = "\(components?.path ?? "")"
    let query = "\(components?.query ?? "")"
    var output = ""
    
    /*
    if let urlString = urlString {
      output += "\(urlString)"
      output += "\n\n"
    }
    */
    if let statusCode =  response?.statusCode {
      output += "HTTP \(statusCode) \(path)?\(query)\n"
    }
    /*
    if let host = components?.host {
      output += "Host: \(host)\n"
    }
    for (key, value) in response?.allHeaderFields ?? [:] {
      output += "\(key): \(value)\n"
    }
     */
    
    if let body = data {
      output += "\n-- Response body --\n"
      output += "\(String(data: body, encoding: .utf8) ?? "")"
    }
    
    if error != nil {
      output += "\nError: \(error!.localizedDescription)"
    }
    print(output)
  }
}
