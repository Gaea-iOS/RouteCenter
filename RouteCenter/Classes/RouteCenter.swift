//
//  RouteCenter.swift
//  Pods
//
//  Created by 王小涛 on 2017/7/7.
//
//

import Foundation
import URLNavigator

// 规定routePattern的格式为restful风格，其中参数placehodler用<>括起来，例如：
// scheme://zooms/<zoom_id>/animals/<animal_id>
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
    static func route(url: String, parameters: [String : String]) -> Bool
}

public class RouteCenter {
    
    public static let `default` = RouteCenter()
    
    private let navigator = Navigator()
    
    private init() {}
    
    public func add<T: Routable>(_ routable: T.Type) {
        map(routable.routePattern, handler: routable.route(url:parameters:))
    }
    
    public func map(_ routePattern: RoutePatternConvertible, handler: @escaping (_ url: String, _ parameters: [String: String]) -> Bool) {
        
        navigator.handle(routePattern.routePattern) { (urlConvertible, values, context) -> Bool in
            let parameters = urlConvertible.queryParameters.reduce(values, {
                var result = $0
                result.updateValue($1.value, forKey: $1.key)
                return result
            })
            let newParameters: [String: String] = parameters.reduce([:], { result, turple in
                var newResult = result
                newResult[turple.key] = turple.value as? String
                return newResult
            })
            return handler(urlConvertible.urlStringValue, newParameters)
        }
    }
    
    public func route(url: String) -> Bool {
        return navigator.open(url)
    }
    
    public func route(url: URL) -> Bool {
        return navigator.open(url)
    }
}
