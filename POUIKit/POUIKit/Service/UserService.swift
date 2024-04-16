//
//  UserService.swift
//  POUIKit
//
//  Created by Wiktor Witkowski on 11/04/2024.
//

import Foundation

protocol UserService{
    
    func fetchUser(completion : @escaping(Result<usrModel,Error>) -> Void)
    
}
