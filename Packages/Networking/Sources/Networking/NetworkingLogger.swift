//
//  NetworkingLogger.swift
//  
//
//  Created by Victor Samuel Cuaca on 23/04/22.
//

import Foundation

public enum NetworkingLogLevel {
    case off
    case info
    case debug
}

final class NetworkingLogger {
    // MARK: - Variables 📦
    
    var logLevel = NetworkingLogLevel.off

    // MARK: - Methods ⛓
    
    func log(request: URLRequest) {
        guard logLevel != .off else { return }
        
        if let method = request.httpMethod,
            let url = request.url {
            print("\(method) '\(url.absoluteString)'")
            logHeaders(request)
            logBody(request)

        }
        
        if logLevel == .debug {
            logCurl(request)
        }
    }

    func log(response: URLResponse, data: Data) {
        guard logLevel != .off else { return }
        
        if let response = response as? HTTPURLResponse {
            logStatusCodeAndURL(response)
        }
        
        if logLevel == .debug {
            print(String(decoding: data, as: UTF8.self))
        }
    }
    
    func log(error: Error) {
        guard logLevel != .off else { return }
        print("🔴 \(error.localizedDescription)")
    }
    
    // MARK: - Private Methods 🔒

    private func logHeaders(_ urlRequest: URLRequest) {
        if let allHTTPHeaderFields = urlRequest.allHTTPHeaderFields {
            for (key, value) in allHTTPHeaderFields {
                print("  \(key) : \(value)")
            }
        }
    }

    private func logBody(_ urlRequest: URLRequest) {
        if let body = urlRequest.httpBody,
            let str = String(data: body, encoding: .utf8) {
            print("  HttpBody : \(str)")
        }
    }

    private func logStatusCodeAndURL(_ urlResponse: HTTPURLResponse) {
        if let url = urlResponse.url {
            print("\(urlResponse.statusCode) '\(url.absoluteString)'")
        }
    }
    
    private func logCurl(_ urlRequest: URLRequest) {
        print(urlRequest.toCurlCommand())
    }
}

extension URLRequest {
    /**
        Heavily inspired from : https://gist.github.com/shaps80/ba6a1e2d477af0383e8f19b87f53661d
     */
    public func toCurlCommand() -> String {
        guard let url = url else { return "" }
        var command = ["curl \"\(url.absoluteString)\""]

        if let method = httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }

        allHTTPHeaderFields?
            .filter { $0.key != "Cookie" }
            .forEach { command.append("-H '\($0.key): \($0.value)'")}

        if let data = httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }

        return command.joined(separator: " \\\n\t")
    }
}
