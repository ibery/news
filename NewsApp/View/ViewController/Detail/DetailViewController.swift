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
    @IBOutlet var shareImage: UIImageView!
    @IBOutlet var favoriteImage: UIImageView!
    @IBOutlet var authorImage: UIImageView!
    @IBOutlet var calendarImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var calendarLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var contentLabel: UILabel!
    
    var newsModel = Article()
    var realmNewsModel = RealmNewsModel()
    private var realmNewsViewModel = RealmNewsViewModel()
    var pageControl = Bool ()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        addRecognizer()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
   
    
    // MARK: - Setup
    func addRecognizer (){
        shareImage.isUserInteractionEnabled = true
        let shareRecognizer = UITapGestureRecognizer(target: self, action: #selector(shareClick))
        shareImage.addGestureRecognizer(shareRecognizer)
        
        favoriteImage.isUserInteractionEnabled = true
        let favoriteRecognizer = UITapGestureRecognizer(target: self, action: #selector(favoriteClick))
        favoriteImage.addGestureRecognizer(favoriteRecognizer)
    }
    
    func setupScreen (){
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
            descriptionLabel.text = realmNewsModel.description
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
    
    
    // MARK: - Actions
    @IBAction func NewsSourceButtonClick(_ sender: UIButton) {
        guard let viewController = Storyboard.source.viewController else {return}
        self.navigationController?.show(viewController, sender: nil)
    }
    
    @objc func shareClick (){
        print("share image click")
        
    }
    @objc func favoriteClick(){
        
        print("favorite image click")
        matchRealmToArticle()
        realmNewsViewModel.addFavorite(realmNewsModel: realmNewsModel)
        
    }
    
    
    //MARK: - Methods
    
    func matchRealmToArticle (){
        if let title = newsModel?.title{realmNewsModel.title = title}
        if let urlToImage = newsModel?.urlToImage{realmNewsModel.urlToImage = urlToImage}
        if let author = newsModel?.author{realmNewsModel.author = author}
        if let publishedAt = newsModel?.publishedAt{realmNewsModel.publishedAt = publishedAt}
        if let articleDescription = newsModel?.articleDescription{realmNewsModel.articleDescription = articleDescription}
        if let content = newsModel?.content{realmNewsModel.content = content}
        if let url = newsModel?.url{realmNewsModel.url = url}
        
    }
}

