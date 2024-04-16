//
//  POUIKitTests.swift
//  POUIKitTests
//
//  Created by Wiktor Witkowski on 08/04/2024.
//

import XCTest
@testable import POUIKit

final class POUIKitTests: XCTestCase {
    
    private var userVM : UsrViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    

    override func setUpWithError() throws {
        userService = MockUserService()
        userVM = UsrViewModel(service: userService)
        output = MockUserViewModelOutput()
        userVM.output = output
        
    }

    override func tearDownWithError() throws {
        userService = nil
        userVM = nil
        
    }

    func testUpdateView_WhenApiSuccess_showsTitleBody() throws {
        let mockUser = usrModel(userID: 1, id: 1, title: "SlimShady", body: "Eminem")
        userService.fetchUserMockResult = .success(mockUser)
        userVM.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.title, "SlimShady")
     
    }
    
    func testUpdateView_whenApiFailure_showsNoTitle() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userVM.fetchUsers()
        XCTAssertEqual(output.updateViewArray.first?.title, "NO")
    }

  

}

class MockUserService : UserService {
    var fetchUserMockResult : Result<POUIKit.usrModel, Error>?
    func fetchUser(completion: @escaping (Result<POUIKit.usrModel, any Error>) -> Void) {
        if let result = fetchUserMockResult{
            completion(result)
        }
        
    }
}

class MockUserViewModelOutput : UsrViewModelOutput{
    var updateViewArray : [(title : String, body : String)] = []
    func updateView(title: String, body: String) {
        updateViewArray.append((title, body))
    }
    
    
}
