//
//  RouteCenter.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation
import URLNavigator

public protocol RoutePatternConvertible {
    var routePattern: String {get}
}

extension String {
    var routePattern: String {
        return self
    }
}

public protocol Routable {
    static var routePattern: RoutePatternConvertible {get}
    static func route(url: String, parameters: [String : Any]) -> Bool
}

public class RouteCenter {
    
    public static let `default` = RouteCenter()
    
    private init() {}
    
    public func add<T: Routable>(_ routable: T.Type) {
        map(routable.routePattern, handler: routable.route(url:parameters:))
    }
    
    public func map(_ routePattern: RoutePatternConvertible, handler: @escaping (_ url: String, _ parameters: [String: Any]) -> Bool) {
        Navigator.map(routePattern.routePattern) { (urlConvertible, values) -> Bool in
            let parameters = urlConvertible.queryParameters.reduce(values, {
                var result = $0
                result.updateValue($1.value, forKey: $1.key)
                return result
            })
            return handler(urlConvertible.urlStringValue, parameters)
        }
    }
    
    public func route(url: String) -> Bool {
        return Navigator.open(url)
    }
    
    public func route(url: URL) -> Bool {
        return Navigator.open(url)
    }
}
