//
//  NewsTableCell.swift
//  News
//
//  Created by Savvycom on 10/05/2022.
//

import UIKit
import Reusable
import SDWebImage
import Support

class NewsTableCell: UITableViewCell, NibReusable {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublishedAtLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(article: Article) {
        newsImageView.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "news_thumbnail", in: Bundle(for: NewsDetailViewController.self), compatibleWith: nil), options: .continueInBackground, completed: nil)
        newsTitleLabel.text = article.title
        let date = (article.publishedAt ?? "").date(format: "yyyy-MM-dd'T'HH:mm:ssZ") ?? Date()
        newsPublishedAtLabel.text = date.string(format: "dd MMM yyyy, HH:mm:ss")
    }
}
