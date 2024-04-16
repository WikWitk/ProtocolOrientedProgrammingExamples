//
//  APIManager.swift
//  POUIKit
//
//  Created by Wiktor Witkowski on 10/04/2024.
//

import Foundation




class APIManager : UserService{
    //dostepne w kazdej pliku
//    static let shared = APIManager()
//    
//    //it means that nobody will be able to create instance of the API Manager outside of this class
//    private init(){
//        
//    }
    
    func fetchUser(completion : @escaping(Result<usrModel,Error>) -> Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([usrModel].self, from: data).first {
                    completion(.success(user))
                }else{
                    completion(.failure(NSError()))
                }
            }
            
        }.resume()
        
    }
    
}
