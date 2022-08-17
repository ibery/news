//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit

class HomeViewController : BaseViewController  {
    
    
    // MARK: - Properties
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    private var newsViewModel = NewsViewModel ()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.cell.homeCell)
        
        newsViewModel.downloadNews(tableView: tableView)
        
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     //   newsViewModel.downloadNews(tableView: tableView)
    }
    
    
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
    



    
}

extension HomeViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return newsViewModel.newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.homeCell, for: indexPath) as? HomeTableViewCell else {fatalError()}
        
        newsViewModel.downloadNews(tableView: self.tableView)
        
        cell.titleLabel.text = newsViewModel.newsList[indexPath.row].title
        cell.descriptionLabel.text = newsViewModel.newsList[indexPath.row].description
        
        let url = URL(string:newsViewModel.newsList[indexPath.row].urlToImage ?? "")
        let data = try? Data(contentsOf: url!)
        cell.imageView?.image = UIImage(data: data!)
        
//       let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.homeCell, for: indexPath) as! HomeTableViewCell
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 140.0
        return rowHeight
        //tableView.frame.height/5
    }
    
    
}

