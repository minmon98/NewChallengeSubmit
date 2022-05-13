//
//  NewsViewController.swift
//  News
//
//  Created by Savvycom on 10/05/2022.
//

import UIKit
import CoreUI
import Core
import RxSwift
import SkeletonView

class NewsViewController: BaseViewController {
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    private var viewModel: NewsViewModel!
    private let disposeBag = DisposeBag()
    private var articles = [Article]()
    private var isLoaded = false
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
        showLoading()
    }
    
    private func showSkeleton() {
        isLoaded = false
        articles.removeAll()
        newsTableView.showAnimatedGradientSkeleton()
        newsTableView.reloadData()
    }
    
    override func showLoading() {
        showSkeleton()
        viewModel.input.onLoading.onNext(())
    }
    
    override func hideLoading() {
        newsTableView.refreshControl?.endRefreshing()
        newsTableView.hideSkeleton()
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isLoaded ? articles.count : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: NewsTableCell.self)
        if isLoaded {
            cell.hideSkeleton()
            cell.setupCell(article: articles[indexPath.row])
        } else {
            cell.showAnimatedGradientSkeleton()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.input.onNext.onNext(articles[indexPath.row])
    }
}

extension NewsViewController: ViewControllerType {
    typealias ViewModelType = NewsViewModel
    
    func configViewModel(viewModel: NewsViewModel) {
        self.viewModel = viewModel
    }
    
    func setupViews() {
        newsTableView.register(cellType: NewsTableCell.self)
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.refreshControl = refreshControl
    }
    
    @objc func refreshData() {
        showSkeleton()
        viewModel.input.onRefresh.onNext(searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
    }
    
    func bindViewModel() {
        // MARK: - Input
        let input = viewModel.input
        disposeBag.insert([
            searchTextField
                .rx
                .text
                .map({ $0?.trimmingCharacters(in: .whitespacesAndNewlines) })
                .bind(to: input.onChange),
            searchTextField
                .rx
                .controlEvent(.editingChanged)
                .subscribe(onNext: { [weak self] in
                    self?.showSkeleton()
                })
        ])
        
        // MARK: - Output
        let output = viewModel.output
        disposeBag.insert([
            output.onDisplay
                .subscribe(onNext: { [weak self] articles in
                    self?.setupDisplay(articles: articles)
                }),
            output.onError
                .subscribe(onNext: { [weak self] error in
                    self?.showError(error: error)
                })
        ])
    }
    
    func setupDisplay(articles: [Article]) {
        self.isLoaded = true
        self.articles = articles
        self.newsTableView.reloadData()
        self.hideLoading()
    }
}
