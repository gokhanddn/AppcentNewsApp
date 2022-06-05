//
//  ArticleDetailViewController.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class ArticleDetailViewController: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var labelAuthor: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelDescriptionText: UILabel!
    @IBOutlet private weak var labelDescription: UILabel!
    @IBOutlet private weak var labelContent: UILabel!
    @IBOutlet private weak var imageViewNews: UIImageView!
    
    // MARK: - Properties
    /// View Models
    var viewModel: ArticleDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    /// Variables
    var ArticleDetail: ArticleDetailPresentation?
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        initView()
    }
    
    private func initView() {
        setupLocalizationStrings()
        viewModel?.load()
    }
    
    private func setupLocalizationStrings() {
        labelDescriptionText.text = LanguageManager.shared.desc
    }
    
    // MARK: - Methods
    private func updateUI(_ presentation: ArticleDetailPresentation) {
        ArticleDetail = presentation
        
        labelTitle.text = presentation.title
        labelAuthor.text = presentation.author
        labelDate.text = presentation.publishedDate
        labelDescription.text = presentation.desc
        labelContent.text = presentation.content
        imageViewNews.image(from: presentation.imageUrl, placeHolder: nil)
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
        }
    }
}
