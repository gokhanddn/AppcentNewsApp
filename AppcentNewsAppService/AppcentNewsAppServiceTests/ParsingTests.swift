//
//  ParsingTests.swift
//  AppcentNewsAppServiceTests
//
//  Created by GOKHAN on 5.06.2022.
//

import XCTest
@testable import AppcentNewsAppService
import Core
import struct AppcentNewsAppModel.ArticleModel

class ParsingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsing() throws {
        let bundle = Bundle(for: AppcentNewsAppServiceTests.self)
        let url = try bundle.url(forResource: "article", withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let article = try decoder.decode(ArticleModel.self, from: data)
        
        XCTAssertEqual(article.title, "Alphonso Davies to return for Canada’s matches in June vs. Iran, Curacao, Honduras - Sportsnet.ca")
        XCTAssertEqual(article.publishedAt, "2022-05-25T19:12:00Z")
    }
}
