//
//  ViewController.swift
//  RouteCenter
//
//  Created by wangxiaotao on 07/07/2017.
//  Copyright (c) 2017 wangxiaotao. All rights reserved.
//

import UIKit
import RouteCenter

struct AppRoutePattern: RoutePatternConvertible {
    var routePattern: String {
        return [scheme, "://", pattern.trimmingCharacters(in: CharacterSet(charactersIn: "/"))].joined()
    }

    let scheme: String = "amateur"
    let pattern: String
    init(pattern: String) {
        self.pattern = pattern
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    @IBAction func clickButton(sender: Any) {
//        let id = 9_223_372_036_854_775_805
//        if let url = URL(string: "amateur://items/\(id)?nickname=jerry") {
//            UIApplication.shared.openURL(url)
//        }
        
        let d = URL(string: "amateur://images?index=5&image_keys[]=eiadjfj1&image_keys[]=eiadjfj2&image_keys[]=eiadjfj3")!
        UIApplication.shared.openURL(d)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

