//
//  ProfileViewController.swift
//  Spotify
//
//  Created by  Ivan Kamenev on 03.06.2021.
//

import SDWebImage
import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        return tableView
    }()
    
    private var models = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.addSubview(tableView)
        fetchProfile()
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    private func fetchProfile() {
        
            APICaller.shared.getCurrentUserProfile { [weak self] result in
                DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(whith: model)
                    break
                case .failure(let error):
                    print("Profile error: \(error.localizedDescription)")
                    self?.failedToGetProfile()
                }
        }
        }
    }
    
    private func updateUI(whith model: UserProfile){
        tableView.isHidden = false
        // Configure table models
        models.append("Full name: \(model.display_name)")
        models.append("Email adress: \(model.email)")
        models.append("User ID: \(model.id)")
        models.append("Plan: \(model.country)")
        createTableHader(with: model.images.first?.url)
        tableView.reloadData()
    }
    
    private func createTableHader(with string: String?) {
        guard let urlString = string, let url = URL(string: urlString) else {
            return
        }
    
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        let imageSize: CGFloat = headerView.height/2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        imageView.center = headerView.center
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize/2
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: url, completed: nil)
        
        tableView.tableHeaderView = headerView
    }
    
    private func failedToGetProfile() {
        let label = UILabel(frame: .zero)
        label.text = "Faled to load profile"
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
 
        
    }
    
    //MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
}
