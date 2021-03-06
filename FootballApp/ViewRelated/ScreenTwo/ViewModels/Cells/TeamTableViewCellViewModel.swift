//
//  TeamTableViewCellViewModel.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/27/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation

// MARK: - TeamTableViewCellViewModel
class TeamTableViewCellViewModel {
    
    
    // MARK: - Properties
    var team:StorageTeam
    
    // MARK: - Init
    init(team:StorageTeam) {
        self.team = team
    }
}
