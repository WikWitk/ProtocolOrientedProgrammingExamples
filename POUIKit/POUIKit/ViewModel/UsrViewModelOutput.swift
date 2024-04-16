//
//  UsrViewModelOutput.swift
//  POUIKit
//
//  Created by Wiktor Witkowski on 14/04/2024.
//

import Foundation

protocol UsrViewModelOutput : AnyObject {
    func updateView(title : String, body: String)
}
