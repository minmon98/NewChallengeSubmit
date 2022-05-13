//
//  NewsDetailViewController.swift
//  News
//
//  Created by Savvycom on 11/05/2022.
//

import UIKit
import CoreUI
import SDWebImage
import RxSwift

class NewsDetailViewController: BaseViewController {
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsPublishedAtLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    @IBOutlet weak var newsContentLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    private let disposeBag = DisposeBag()
    var article: Article!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        observe()
    }
    
    private func setupViews() {
        newsImageView.sd_setImage(with: URL(string: article.urlToImage ?? ""), placeholderImage: UIImage(named: "news_thumbnail", in: Bundle(for: NewsDetailViewController.self), compatibleWith: nil), options: .continueInBackground) { [weak self] _,_,_,_ in
            UIView.animate(withDuration: 1.0) {
                self?.newsImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
        }
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(openSourceUrl))
        sourceLabel.isUserInteractionEnabled = true
        sourceLabel.addGestureRecognizer(tapGesture)
        sourceLabel.attributedText = NSAttributedString(string: article.source?.name ?? "", attributes: [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16.0), .underlineStyle: NSUnderlineStyle.single.rawValue])
        newsTitleLabel.text = article.title
        let date = (article.publishedAt ?? "").date(format: "yyyy-MM-dd'T'HH:mm:ssZ") ?? Date()
        newsPublishedAtLabel.text = date.string(format: "dd MMM yyyy, HH:mm:ss")
        newsDescriptionLabel.text = article.description
        newsContentLabel.text = article.content
    }
    
    private func observe() {
        backButton
            .rx
            .tap
            .subscribe(onNext: { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    @objc func openSourceUrl() {
        guard let url = URL(string: article.url ?? "") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
