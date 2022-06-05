//
//  ArticleListViewController.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class ArticleListViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableViewArticle: UITableView!
    
    // MARK: - Properties
    /// View Models
    var viewModel: ArticleListViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    /// Variables
    var articleList: [ArticlePresentation] = []
    private var currentSearchText = ""
    private var currentPage = 1
    private let minimumSearchTextLength = 3
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup & Initializers
    private func setup() {
        registerNibs()
        setDelegates()
        initTableView()
        initSearchBar()
    }
    
    private func registerNibs() {
        tableViewArticle.register(UINib(nibName: Constants.ReuseIdentifiers.articleCell, bundle: nil), forCellReuseIdentifier: Constants.ReuseIdentifiers.articleCell)
        tableViewArticle.register(UINib(nibName: Constants.ReuseIdentifiers.loadingMore, bundle: nil), forHeaderFooterViewReuseIdentifier: Constants.ReuseIdentifiers.loadingMore)
    }
    
    private func setDelegates() {
        tableViewArticle.dataSource = self
        tableViewArticle.delegate = self
        searchBar.delegate = self
    }
    
    private func initTableView() {
        tableViewArticle.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
    
    private func initSearchBar() {
        searchBar.placeholder = LanguageManager.shared.search
    }
    
    // MARK: - Methods
    private func showArticle() {
        reloadTableView()
        if currentPage == 1 {
            tableViewArticle.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    
    private func reloadTableView() {
        tableViewArticle.reloadData()
    }
    
    private func loadArticles() {
        viewModel?.load(with: currentSearchText, in: currentPage)
    }
    
    private func search(with text: String) {
        guard text.count >= minimumSearchTextLength else { return }
        currentSearchText = text
        currentPage = 1
        loadArticles()
    }
    
    // MARK: - Selectors
    @objc func loadMoreTapped(sender: UIButton) {
        sender.isHidden = true
        currentPage += 1
        loadArticles()
    }
}

// MARK: - ArticleListViewModelDelegate
extension ArticleListViewController: ArticleListViewModelDelegate {
    func handleViewModelOutput(_ output: ArticleListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            print("isLoading \(isLoading)")
        case .showArticleList(let articles):
            articleList = articles
            DispatchQueue.main.async {
                self.showArticle()
            }
        }
    }
    
    func navigate(to route: ArticleListViewRoute) {
        switch route {
        case .detail(let articleModel):
            let viewController = ArticleDetailBuilder.make(with: articleModel)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource
extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.articleCell, for: indexPath) as! ArticleCell
        cell.article = articleList[indexPath.row]
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ArticleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectArticle(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if viewModel?.isLoadingMoreVisible() ?? false {
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.ReuseIdentifiers.loadingMore) as! LoadingMoreFooterView
            footerView.activityIndicator.startAnimating()
            footerView.buttonLoadMore.setTitle(LanguageManager.shared.loadMore, for: .normal)
            footerView.buttonLoadMore.isHidden = false
            footerView.buttonLoadMore.addTarget(self, action: #selector(loadMoreTapped(sender:)), for: .touchUpInside)
            return footerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if viewModel?.isLoadingMoreVisible() ?? false {
            return 50
        }
        return 0.1
    }
}

// MARK: - UISearchBarDelegate
extension ArticleListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.searchTextField.text else { return }
        searchBar.resignFirstResponder()
        search(with: searchText)
    }
}
