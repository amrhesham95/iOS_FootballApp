//
//  LeaguesScreenViewController.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import UIKit

// MARK: - LeaguesScreenViewController
class LeaguesScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var viewModel: LeaguesScreenViewModel! 
    
    // MARK: - Init
    init(viewModel:LeaguesScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bindOnViewModel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

 

}

// MARK: - DataSource Conformance
extension LeaguesScreenViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(LeagueTableViewCell.self)
        configureCell(cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.competitions.value.count
    }
}

extension LeaguesScreenViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let teamsScreenViewController = TeamsScreenViewController(viewModel: TeamsScreenViewModel(competitionID: self.viewModel.competitions.value[indexPath.row].id))
        self.navigationController?.pushViewController(teamsScreenViewController, animated: true)
        

    }
}

// MARK: - Binding
private extension LeaguesScreenViewController {
    
    func bindOnViewModel() {
        self.viewModel.competitions.addObserver(fireNow: false) { (comptetions) in
            self.tableView.reloadData()
        }
    }
}

// MARK: - ConfigureVIew
private extension LeaguesScreenViewController {
    
    func configureTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.registerCellNib(LeagueTableViewCell.self)
    }
    
    func configureCell(_ cell:LeagueTableViewCell, at indexPath :IndexPath){
        
        // view model has subscript that takes an index and return the competition with the right index
        let cellViewModel = LeagueTableViewCellViewModel(competition: viewModel[indexPath.row])
        cell.viewModel = cellViewModel
    }
}
