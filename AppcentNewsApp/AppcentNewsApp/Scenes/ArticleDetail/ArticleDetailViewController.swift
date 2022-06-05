//
//  ArticleDetailViewController.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit
import SwiftUI

final class ArticleDetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelAuthor: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelDescriptionText: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!
    @IBOutlet private weak var labelContent: UILabel!
    @IBOutlet private weak var imageViewNews: UIImageView!
    @IBOutlet private weak var buttonFavorite: UIButton!
    @IBOutlet private weak var buttonSource: UIButton!
    
    // MARK: - Properties
    /// View Models
    var viewModel: ArticleDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    /// Variables
    var articleDetail: ArticleDetailPresentation?
    var isFavorite: Bool = false
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - Setup & Initializers
    private func setup() {
        initView()
    }
    
    private func initView() {
        setupLocalizationStrings()
        viewModel?.load()
        isFavorite = viewModel?.isFavorite() ?? false
        updateFavoriteButtonAppearance()
    }
    
    private func setupLocalizationStrings() {
        labelDescriptionText.text = LanguageManager.shared.desc
        buttonSource.setTitle(LanguageManager.shared.goSource, for: .normal)
    }
    
    // MARK: - Methods
    private func updateUI(_ presentation: ArticleDetailPresentation) {
        articleDetail = presentation
        
        LogEventManager.shared.logEvent(name: Constants.AnalyticsEventName.articleDetail, params: ["title": articleDetail?.title ?? String()])
        
        labelTitle.text = presentation.title
        labelAuthor.text = presentation.author
        labelDate.text = presentation.publishedDate
        labelDescription.text = presentation.desc
        labelContent.text = presentation.content
        imageViewNews.image(from: presentation.imageUrl, placeHolder: nil)
    }
    
    private func updateFavoriteButtonAppearance() {
        if isFavorite {
            buttonFavorite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            buttonFavorite.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    private func goToSource(with urlString: String) {
        let swiftUIController = UIHostingController(rootView: ArticleSourceView(sourceUrl: urlString))
        navigationController?.pushViewController(swiftUIController, animated: true)
    }
    
    // MARK: - IBActions
    @IBAction private func buttonFavoriteAction(_ sender: UIButton) {
        viewModel?.addOrRemoveFavorite()
    }
    
    @IBAction private func buttonShareAction(_ sender: UIButton) {
        share(title: articleDetail?.title ?? String(), sourceUrl: articleDetail?.sourceUrl ?? String())
    }
    
    @IBAction private func buttonSourceAction(_ sender: UIButton) {
        viewModel?.goToSource()
    }
}

// MARK: - ArticleDetailViewModelDelegate
extension ArticleDetailViewController: ArticleDetailViewModelDelegate {
    func handleViewModelOutput(_ output: ArticleDetailViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .showArticleDetail(let article):
            updateUI(article)
        case .updatedFavorite(let isSuccess):
            if isSuccess {
                isFavorite = !isFavorite
                updateFavoriteButtonAppearance()
            }
        }
    }
    
    func navigate(to route: ArticleDetailViewRoute) {
        switch route {
        case .detail(let source):
            goToSource(with: source)
        }
    }
}
