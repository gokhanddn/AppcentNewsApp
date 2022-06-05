//
//  FavoriteListViewController.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class FavoriteListViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableViewArticle: UITableView!
    
    // MARK: - Properties
    /// View Models
    var viewModel: FavoriteListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    /// Variables
    var articleList: [ArticlePresentation] = []
    
    // MARK: - Life cycle methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.load()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup & Initializers
    private func setup() {
        registerNibs()
        setDelegates()
    }
    
    private func registerNibs() {
        tableViewArticle.register(UINib(nibName: Constants.ReuseIdentifiers.articleCell, bundle: nil), forCellReuseIdentifier: Constants.ReuseIdentifiers.articleCell)
    }
    
    private func setDelegates() {
        tableViewArticle.dataSource = self
        tableViewArticle.delegate = self
    }
    
    // MARK: - Methods
    private func showArticles() {
        reloadTableView()
    }
    
    private func reloadTableView() {
        tableViewArticle.reloadData()
    }
}

extension FavoriteListViewController: FavoriteListViewModelDelegate {
    func handleViewModelOutput(_ output: FavoriteListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .showArticleList(let articles):
            articleList = articles
            showArticles()
        }
    }
    
    func navigate(to route: FavoriteListViewRoute) {
        switch route {
        case .detail(let articleModel):
            if let viewController = ArticleDetailBuilder.make(with: articleModel) {
                navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}

extension FavoriteListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.articleCell, for: indexPath) as? ArticleCell
        cell?.article = articleList[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

extension FavoriteListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectArticle(at: indexPath.row)
    }
}
