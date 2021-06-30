    import XCTest
    @testable import MTFoundation

    final class MTFoundationTests: XCTestCase {
        func testExample() {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct
            // results.
//            XCTAssertEqual(MyLibrary.text, "Hello, World!")
            let image = UIImageView()
            image.loadImage(from: URL(string: "https://appicon.co/logo.png")!)
            
            UIEdgeInsets(vertical: 0)
        }
    }
