//
//  Checker.swift
//  Navigation
//
//  Created by Valery Shel on 08.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class Checker {
    
    private let login = "John"
    private let password = "John"
    
    
    static var shared: Checker = {
        let instance = Checker()
        
        return instance
    }()
        
    private init() { }
    
    func isLoginCorrect(_ login: String) -> Bool {
        return login == self.login
    }
    
    func isPasswordCorrect(_ password: String) -> Bool {
        return password == self.password
    }
   
}

@available(iOS 13.0, *)
extension Checker: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
