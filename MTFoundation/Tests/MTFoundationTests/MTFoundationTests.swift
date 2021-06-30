    import XCTest
    @testable import MTFoundation

    final class MTFoundationTests: XCTestCase {
        
        func testImageLoader() {
            let image = UIImageView()
            image.loadImage(from: URL(string: "https://appicon.co/logo.png")!)
        }
        
        func testUIEdgeInsetsInitializers() {
            var insets = UIEdgeInsets()
            XCTAssertEqual(insets.top, 0)
            XCTAssertEqual(insets.left, 0)
            XCTAssertEqual(insets.bottom, 0)
            XCTAssertEqual(insets.right, 0)
            
            insets = UIEdgeInsets(vertical: 10, horizontal: 10)
            XCTAssertEqual(insets.top, 10)
            XCTAssertEqual(insets.left, 10)
            XCTAssertEqual(insets.bottom, 10)
            XCTAssertEqual(insets.right, 10)
        }
    }
