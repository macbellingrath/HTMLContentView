//
//  HTMLBuilder.swift
//  Stepic
//
//  Created by Alexander Karpov on 24.10.15.
//  Copyright © 2015 Alex Karpov. All rights reserved.
//

import UIKit

class HTMLBuilder: NSObject {
    private override init() {}
    static var sharedBuilder = HTMLBuilder()
    
    private var stepicStyleString : String {        
        var res : String = ""
        res += "<style>"
        res += "\nhtml{-webkit-text-size-adjust: 100%;}"
        res += "\nbody{font-size: 12pt; font-family:Arial, Helvetica, sans-serif; line-height:1.6em;}"
        res += "\nh1{font-size: 20pt; font-family:Arial, Helvetica, sans-serif; line-height:1.6em;}"
        res += "\nh2{font-size: 17pt; font-family:Arial, Helvetica, sans-serif; line-height:1.6em;}"
        res += "\nh3{font-size: 14pt; font-family:Arial, Helvetica, sans-serif; line-height:1.6em;}"
        res += "\nimg { max-width: 100%; }"
        
//        res += "\np { white-space: pre-wrap; word-wrap: break-word; max-width: 100%; }"
//        res += "\npre { white-space: pre-wrap; word-wrap: break-word; max-width: 100%; }"

        res += "\n</style>\n"
        return res
    }
    
    func buildHTMLStringWith(head head: String, body: String, addStepicFont : Bool = true, width: Int) -> String {
        var res = "<html>\n"
        
        res += "<head>\n\(stepicStyleString + head)\n</head>\n"
//        print(body)
        res += "<body style=\"width:\(width))px;\">\n\(body)\n</body>\n"
        
        res += "</html>"
        return res
    }
    
    func buildHTMLStringWith(head head: String, body: String, addStyle: Bool = false, textColorHex: String = "#000000") -> String {
        var res = "<html>\n"
        
        if addStyle {
            res += "<head>\n\(stepicStyleString + head)\n</head>\n"
        } else {
            res += "<head>\n\(head)\n</head>\n"
        }
        //        print(body)
        let bodyOpenTag = "<body text=\"\(textColorHex)\">"
        res += "\(bodyOpenTag)\n\(body)\n</body>\n"
        
        res += "</html>"
        return res
    }
}
