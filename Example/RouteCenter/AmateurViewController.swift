//
//  AmateurViewController.swift
//  RouteCenter
//
//  Created by 王小涛 on 2017/7/7.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import UIKit
import RouteCenter

extension AmateurViewController: Routable {
    static var routePattern: RoutePatternConvertible {
        return AppRoutePattern(pattern: "/items/<id>")
    }
    static func route(url: String, parameters: [String : String]) -> Bool {
        guard let id = parameters["id"]?.intValue else {return false}
        let controller = AmateurViewController()
        let nickname = parameters["nickname"]
        controller.title = "amateur item \(id) \(nickname!)"
        UIViewController.topMost?.navigationController?.pushViewController(controller, animated: true)
        return true
    }
}

class AmateurViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
