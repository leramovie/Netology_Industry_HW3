//
//  LoginViewDelegate.swift
//  Navigation
//
//  Created by Valery Shel on 12.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didTapLoginButton(filledLogin: String, filledPassword: String)
}

