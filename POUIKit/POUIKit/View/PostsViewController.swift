//
//  ViewController.swift
//  POUIKit
//
//  Created by Wiktor Witkowski on 08/04/2024.
//

import UIKit

class PostsViewController: UIViewController, UsrViewModelOutput {
    
    
    
   private let viewModel : UsrViewModel
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private let bodyLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: UsrViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil )
        self.viewModel.output = self
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        setUpViews()
//        fetchUsers()
        viewModel.fetchUsers()
    }
    
    
    private func setUpViews(){
        view.backgroundColor = .red
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        
        
        NSLayoutConstraint.activate([
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 350),
            titleLabel.widthAnchor.constraint(equalToConstant: 350),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            bodyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyLabel.heightAnchor.constraint(equalToConstant: 60),
            bodyLabel.widthAnchor.constraint(equalToConstant: 200),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100)
            
            
        
        ])
        
    }
    
    func updateView(title: String, body: String) {
        self.titleLabel.text = title
        self.bodyLabel.text = body
    }
//
//    private func fetchUsers(){
//        APIManager.shared.fetchUser { result in
//            switch result {
//            case .success(let user):
//                self.titleLabel.text = user.title
//                self.bodyLabel.text = user.body
//            case .failure:
//                self.titleLabel.text = "No user found"
//            }
//        }
//    }

}

