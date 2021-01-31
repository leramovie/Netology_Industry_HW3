//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Valery Shel on 12.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
    func checkLogin(_ login: String, completion: (Bool) -> Void)
    func checkPassword(_ password: String, completion: (Bool) -> Void)
}
