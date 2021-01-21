//
//  AuthManager.swift
//  Navigation
//
//  Created by Valery Shel on 12.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class AuthManager: LoginViewControllerDelegate {
    
    func checkLogin(_ login: String, completion: (Bool) -> Void) {
        completion(Checker.shared.isLoginCorrect(login))
    }
    
    func checkPassword(_ password: String, completion: (Bool) -> Void) {
        completion(Checker.shared.isPasswordCorrect(password))
    }
}
