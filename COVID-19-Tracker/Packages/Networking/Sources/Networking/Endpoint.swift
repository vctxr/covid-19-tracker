//
//  Endpoint.swift
//  
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation

public protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var urlParameters: [URLQueryItem] { get }
}

public extension Endpoint {
    var urlCompononents: URLComponents {
        var urlCompononents = URLComponents(string: baseUrl)!
        urlCompononents.path = path
        urlCompononents.queryItems = urlParameters
        return urlCompononents
    }
    
    var urlRequest: URLRequest {
        URLRequest(url: urlCompononents.url!)
    }
}
