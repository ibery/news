//
//  FavoriteViewController.swift
//  NewsApp
//
//  Created by Narkoz on 16.08.2022.
//

import UIKit
import RealmSwift

class  FavoriteViewController : BaseViewController  {
    
    
    // MARK: - Properties
    
    @IBOutlet var tableView: UITableView!
    
    private var realmModel : Results<RealmNewsModel>?
    private var realmNewsViewModel = RealmNewsViewModel()
    let realm = try! Realm()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: Constants.tableviewController.homeTableView, bundle: nil), forCellReuseIdentifier: Constants.cell.homeCell)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        realmModel = realmNewsViewModel.getFavorite()
        self.tableView.reloadData()
        self.navigationController?.navigationBar.isHidden = true
       
    }
    
    // MARK: - Setup
    
    
    // MARK: - Actions
    
    
    //MARK: - Methods
    
}

extension FavoriteViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return realmModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cell.homeCell) as? HomeTableViewCell else {return UITableViewCell()}
        
        if let realmModel = realmModel{
            cell.titleLabel.text = realmModel[indexPath.row].title
            cell.descriptionLabel.text = realmModel[indexPath.row].articleDescription
            let url = URL(string: realmModel[indexPath.row].urlToImage)
            
            if let data = try? Data(contentsOf: url!){
                cell.imageViewCell.image = UIImage(data: data)
            }else{
                cell.imageViewCell.image = UIImage(named: Images.notFound.imageName)
            }
        }
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight: CGFloat = 140.0
        return rowHeight
        //tableView.frame.height/5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let realmModel = realmModel{
            let newsModel = realmModel[indexPath.row]
            
            guard let viewController = self.getViewController(fromStoryboard: .detail, type: DetailViewController.self) else {return}
            
            viewController.realmNewsModel = newsModel
            viewController.pageControl = false
            self.navigationController?.show(viewController, sender: nil)
        }else{
            UIWindow.showAlert(title: Constants.Error.title, message: Constants.Error.overView)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteTitle = "Delete"
        let deleteAction = UIContextualAction(style: .destructive, title: deleteTitle) { (action, view, completion) in
            
            self.tableView.beginUpdates()
            do{
                try! self.realm.write {
                    self.realm.delete((self.realmModel![indexPath.row]))
                }
            }catch{
                UIWindow.showAlert(title: Constants.Error.title, message: Constants.Error.notSuccessful)
            }
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.endUpdates()
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        deleteAction.backgroundColor = .systemRed
        
        let configuration = UISwipeActionsConfiguration(actions: [ deleteAction])
        return configuration
    }
    
}

