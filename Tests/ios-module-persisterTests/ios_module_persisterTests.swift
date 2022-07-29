import XCTest
import RealmSwift
import CoreData

@testable import PersisterProtocol
@testable import RealmPersister

final class ios_module_persisterTests: XCTestCase {
    let persister = RealmPersister()

    func testExample() throws {
        XCTAssertEqual("Hello, World!", "Hello, World!")
    }
}


