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
    
    private init() {}
    
    public func add<T: Routable>(_ routable: T.Type) {
        map(routable.routePattern, handler: routable.route(url:parameters:))
    }
    
    public func map(_ routePattern: RoutePatternConvertible, handler: @escaping (_ url: String, _ parameters: [String: String]) -> Bool) {
        
        Navigator.map(routePattern.routePattern) { (urlConvertible, values) -> Bool in
            let parameters = urlConvertible.queryParameters.reduce(values, {
                var result = $0
                result.updateValue($1.value, forKey: $1.key)
                return result
            })
            let newParameters: [String: String] = parameters.reduce([:], { result, turple in
                var newValue: String? {
                    switch turple.value {
                    case let p as UUID:
                        return p.uuidString
                    case let p as String:
                        return p
                    case let p as Int:
                        return String(p)
                    case let p as Float:
                        return String(p)
                    default:
                        return nil
                    }
                }
                var newResult = result
                newResult[turple.key] = newValue
                return newResult
            })
            
            return handler(urlConvertible.urlStringValue, newParameters)
        }
    }
    
    public func route(url: String) -> Bool {
        return Navigator.open(url)
    }
    
    public func route(url: URL) -> Bool {
        return Navigator.open(url)
    }
}
