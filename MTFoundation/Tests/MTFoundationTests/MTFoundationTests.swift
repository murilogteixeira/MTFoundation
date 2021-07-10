    import XCTest
    import Foundation
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
        
        func testDataFromIso() {
            var date: Date?
            date = "2021-06-21T12:28:13Z".iso8601
            XCTAssertNotNil(date, "\(String(describing: date))")
            date = "2019-02-06T00:35:01.746Z".iso8601withFractionalSeconds
            XCTAssertNotNil(date, "\(String(describing: date))")
        }
    }
