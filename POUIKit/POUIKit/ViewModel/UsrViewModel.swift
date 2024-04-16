//
//  UsrViewModel.swift
//  POUIKit
//
//  Created by Wiktor Witkowski on 11/04/2024.
//

import Foundation

class UsrViewModel{
    
    private let service : UserService!
    weak var output : UsrViewModelOutput?
    
    init(service: UserService) {
        self.service = service
    }
    
    func fetchUsers(){
        service.fetchUser { [weak self] result in
            switch result{
            case .success(let user):
                self?.output?.updateView(title: user.title, body: user.body)
            case .failure(_):
                self?.output?.updateView(title: "No posts found", body: "")
            }
        }
        
    }
}
