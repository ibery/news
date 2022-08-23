//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Narkoz on 18.08.2022.
//


import UIKit
import RealmSwift
class DetailViewController : BaseViewController  {
    
    
    // MARK: - Properties
    
    @IBOutlet var authorImage: UIImageView!
    @IBOutlet var calendarImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var calendarLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var sourceButton: UIButton!
    
    var newsModel = Article()
    var realmNewsModel = RealmNewsModel()
    private var realmNewsViewModel = RealmNewsViewModel()
    var pageControl = Bool ()
    private let realm = try! Realm()
    var favoriteButton = UIBarButtonItem()
    var searchButton = UIBarButtonItem()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        updateProterties()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        if pageControl{
            favoriteButton.image = UIImage(systemName: "heart")
        }else{
            favoriteButton.image = UIImage(systemName: "heart.fill")
        }
    }
    
    // MARK: - Setup
    
    func setupScreen(){
        favoriteButton   = UIBarButtonItem(image: UIImage(systemName: "heart"),  style: .plain, target: self, action: #selector(favoriteTapped))
        searchButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),  style: .plain, target: self, action: #selector(shareTapped))
        navigationItem.rightBarButtonItems = [favoriteButton, searchButton]
        favoriteButton.tintColor = .black
        searchButton.tintColor = .black
        sourceButton.layer.borderWidth = 1
        sourceButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    // MARK: - Actions
    
    @IBAction func NewsSourceButtonClick(_ sender: UIButton) {
        
        guard let viewController = self.getViewController(fromStoryboard: .source, type: NewsSourceViewController.self) else {return}
        
        if pageControl{
            guard let url = newsModel?.url else {return}
            viewController.newsUrl = url
        }else{
            viewController.newsUrl = realmNewsModel.url
        }
        
        self.navigationController?.show(viewController, sender: nil)
    }
    
    @objc func shareTapped (){
        var url = String()
        if pageControl{
            url = self.newsModel?.url ?? ""
        }else{
            url = self.realmNewsModel.url
        }
        let shareSheetVC = UIActivityViewController(
            activityItems :[
                url
            ],
            applicationActivities: nil
        )
        present(shareSheetVC, animated: true)
    }
    
    @objc func favoriteTapped(){
        if self.pageControl{
            favoriteButton.image = UIImage(systemName: "heart.fill")
            matchRealmToArticle()
            realmNewsViewModel.addFavorite(realmNewsModel: realmNewsModel)
            favoriteButton.isEnabled = false
            // buraya bir ayar lazım
        }
    }
    
    //MARK: - Methods
    
    private func matchRealmToArticle (){
        if let title = newsModel?.title{realmNewsModel.title = title}
        if let urlToImage = newsModel?.urlToImage{realmNewsModel.urlToImage = urlToImage}
        if let author = newsModel?.author{realmNewsModel.author = author}
        if let publishedAt = newsModel?.publishedAt{realmNewsModel.publishedAt = publishedAt}
        if let articleDescription = newsModel?.articleDescription{realmNewsModel.articleDescription = articleDescription}
        if let content = newsModel?.content{realmNewsModel.content = content}
        if let url = newsModel?.url{realmNewsModel.url = url}
        
    }
    
    private func updateProterties (){
        if pageControl{
            descriptionLabel.text = newsModel?.articleDescription
            calendarLabel.text = newsModel?.publishedAt
            authorLabel.text = newsModel?.author
            contentLabel.text = newsModel?.content
            
            let url = URL(string:newsModel!.urlToImage)
            if let url = url {
                if let data = try? Data(contentsOf: url){
                    detailImage.image = UIImage(data: data)
                }
            }else{
                detailImage.image = UIImage(named:Images.notFound.imageName)
            }
        }else{
            descriptionLabel.text = realmNewsModel.articleDescription
            calendarLabel.text = realmNewsModel.publishedAt
            authorLabel.text = realmNewsModel.author
            contentLabel.text = realmNewsModel.content
            let url = URL(string:realmNewsModel.urlToImage)
            if let url = url {
                if let data = try? Data(contentsOf: url){
                    detailImage.image = UIImage(data: data)
                }
            }else{
                detailImage.image = UIImage(named:Images.notFound.imageName)
            }
        }
    }
}

