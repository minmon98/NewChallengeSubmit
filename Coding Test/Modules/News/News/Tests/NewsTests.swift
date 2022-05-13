//
//  NewsTests.swift
//  News-Unit-Tests
//
//  Created by Savvycom on 5/13/22.
//

import XCTest
@testable import News
@testable import RxSwift

class NewsTests: XCTestCase {
    func testGetListNews() {
        GetNewsUseCase()
            .execute()
            .subscribe(onNext: {
                XCTAssertFalse($0.articles?.isEmpty == true)
            }, onError: {
                XCTFail($0.localizedDescription)
            })
            .disposed(by: DisposeBag())
    }
    
    func testSearchListNews() {
        SearchNewsUseCase()
            .execute(param: "USA")
            .subscribe(onNext: {
                XCTAssertFalse($0.articles?.isEmpty == true)
            }, onError: {
                XCTFail($0.localizedDescription)
            })
            .disposed(by: DisposeBag())
    }
    
    func testEntityMapper() {
        let sourceEntity = SourceEntity()
        sourceEntity.id = "1"
        sourceEntity.name = "USA Today"
        
        let source = Source()
        source.id = "1"
        source.name = "USA Today"
        
        let sourceMapped = sourceEntity.map()
        XCTAssertTrue(sourceMapped.id == source.id)
        XCTAssertTrue(sourceMapped.name == source.name)
    }
}

class NewsViewControllerTests: XCTestCase {
    func makeNewsViewController() -> NewsViewController {
        let viewController = NewsViewController(nibName: "NewsViewController", bundle: Bundle(for: NewsViewController.self))
        let viewModel = NewsViewModel()
        viewController.configViewModel(viewModel: viewModel)
        viewController.loadViewIfNeeded()
        return viewController
    }
    
    func testLoadNewsViewController() {
        let newsViewController = makeNewsViewController()
        newsViewController.viewDidLoad()
        XCTAssertTrue(newsViewController.isViewLoaded)
    }
    
    func testRender() {
        let newsViewController = makeNewsViewController()
        newsViewController.viewDidLoad()
        XCTAssertTrue(newsViewController.searchTextField.placeholder == "Search")
    }
}

class NewsDetailViewControllerTests: XCTestCase {
    func makeNewsDetailViewController() -> NewsDetailViewController {
        let viewController = NewsDetailViewController(nibName: "NewsDetailViewController", bundle: Bundle(for: NewsViewController.self))
        viewController.article = Article()
        viewController.loadViewIfNeeded()
        return viewController
    }
    
    func testLoadNewsViewController() {
        let newsViewController = makeNewsDetailViewController()
        newsViewController.viewDidLoad()
        XCTAssertTrue(newsViewController.isViewLoaded)
    }
}
