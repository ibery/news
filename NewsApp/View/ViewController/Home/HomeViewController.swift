//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit
import Alamofire

class HomeViewController : BaseViewController  {
    
    
    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    private var newsViewModel = NewsViewModel ()
    private var page = 1
    private var urlHome  = Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+page+Constants.pageSize
    private var requestStatus = false
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cell.homeCell)
        homeSearch()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     //   newsViewModel.downloadNews(tableView: tableView)
    }
    
    
    
    // MARK: - Setup

    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    func nextPage(){
        page += 1
        if requestStatus{
            fetchSearch()
        }else{
            homeSearch()
        }
    }
    
    func fetchSearch(){
        if searchTextField.text != nil || searchTextField.text == ""{
            let url = URL(string:Constants.baseUrl+Constants.searchUrl+searchWord+Constants.pageUrl+String(page)+Constants.apiKeyUrl)
            guard let  searchText =  self.searchTextField.text else {return}
            if let url = url {
               newsViewModel.downloadNews(url: url, page: self.page, searchWord: searchText)
               requestStatus = true
           }
        }
    }
    
    func homeSearch(){
        let url = URL(string:     Constants.baseUrl+Constants.country+Constants.apiKeyUrl+Constants.pageUrl+page+Constants.pageSize)
        guard let url = url else {return}
        newsViewModel.downloadNews(url: url, page: self.page, searchWord: "")
        requestStatus = false
    }
    
    
    


}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return newsViewModel.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.homeCell, for: indexPath) as? HomeTableViewCell else {fatalError()}
        
        cell.titleLabel.text = newsViewModel.newsList[indexPath.row].title
        cell.descriptionLabel.text = newsViewModel.newsList[indexPath.row].articleDescription
    
        let url = URL(string:newsViewModel.newsList[indexPath.row].urlToImage)
    
        let data = try? Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data!)
        // burası guard let ile düzenlenecek
        
        
        
        
//       let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.homeCell, for: indexPath) as! HomeTableViewCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsModel = newsViewModel.newsList[indexPath.row]
        
        
        guard let viewController = self.getViewController(fromStoryboard: .detail, type: DetailViewController.self) else {return}
        
        viewController.newsModel = newsModel
        self.navigationController?.show(viewController, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 140.0
        return rowHeight
        //tableView.frame.height/5
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let intTotalRow = tableView.numberOfRows(inSection: indexPath.section)
        if indexPath.row == intTotalRow-1{
            
                nextPage()
            
        }
    }
    
}

