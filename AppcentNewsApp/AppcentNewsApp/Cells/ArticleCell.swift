//
//  ArticleCell.swift
//  AppcentNewsApp
//
//  Created by GOKHAN on 5.06.2022.
//

import UIKit

final class ArticleCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageViewArticle: UIImageView!
    
    // MARK: - Properties
    var article: ArticlePresentation? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: Life cycle methods
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
    }
    
    // MARK: - Methods
    private func updateUI() {
        guard let article = article else { return }
        
        labelTitle.text = article.title
        labelDescription.text = article.desc
        imageViewArticle.layer.cornerRadius = 5
    }
}
