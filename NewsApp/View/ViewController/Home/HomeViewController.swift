//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit
import Alamofire

class HomeViewController : BaseViewController , NewsViewModelDelegate  {

 
    
    
    
    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchImage: UIImageView!
    
    private var newsViewModel = NewsViewModel ()
    private var newsArray = [Article]()
    private var page = 1
    private var requestStatus = false
   
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        newsViewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cell.homeCell)
        addRecognizer()
        newsViewModel.downloadNews( searchWord: searchTextField.text ?? "")
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

    }
    
    
    
    // MARK: - Setup
    
    func addRecognizer (){
        searchImage.isUserInteractionEnabled = true
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageClick))
        searchImage.addGestureRecognizer(recognizer)
    }
    
    // MARK: - Actions
    
    @objc func imageClick (){
        print("image click")
       
    }
    
    //MARK: - Methods
    
    func nextPage(){
        Constants.pageCount += 1
        print(Constants.pageCount)
        newsViewModel.downloadNews(searchWord: self.searchTextField.text ?? "")
   
    }
    
    func newsDataFetch(dataArray: [Article]) {
            self.newsArray = dataArray
    
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.homeCell, for: indexPath) as? HomeTableViewCell else {fatalError()}
        
        cell.titleLabel.text = newsArray[indexPath.row].title
        cell.descriptionLabel.text = newsArray[indexPath.row].articleDescription
    
        let url = URL(string:newsArray[indexPath.row].urlToImage)
    
//        let data = try? Data(contentsOf: url!)
//        cell.imageView?.image = UIImage(data: data!)
        // burası guard let ile düzenlenecek
        
        if let data = try? Data(contentsOf: url!){
            cell.imageView?.image = UIImage(data: data)
        }else{
            cell.imageView?.image = UIImage(named: "favorite")
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsModel = newsViewModel.dataArray[indexPath.row]
        
        
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

//extension HomeViewController : NewsViewModelDelegate {
//    func newsDataFetch(dataArray: [Article]) {
//        self.newsArray = dataArray
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//}
