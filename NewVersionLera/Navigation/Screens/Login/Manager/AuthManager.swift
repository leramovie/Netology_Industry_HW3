//
//  AuthManager.swift
//  Navigation
//
//  Created by Valery Shel on 12.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class AuthManager: LoginViewControllerDelegate {
    
//   //MARK: Этот метод должен обрабатывать нажатие на кнопку в LoginView, т.к. этот класс только для верстки.
//   //и передавать введенные логин и пасс.. наверное, не уверена что здесь
//    func didTapLoginButton(filledLogin: String, filledPassword: String) -> (login: String, password: String) {
//        return (login: filledLogin, password: filledPassword)
//    }
    
    //По заданию, создала 2 метода которые возвращают результат сравнения введенных данных с хардкодными
    func checkLogin(_ login: String, completion: (Bool) -> Void) {
        return completion(Checker.shared.isLoginCorrect(login))
    }
    
    func checkPassword(_ password: String, completion: (Bool) -> Void) {
        return completion(Checker.shared.isPasswordCorrect(password))
    }
}
