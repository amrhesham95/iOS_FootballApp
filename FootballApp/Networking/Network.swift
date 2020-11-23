//
//  Network.swift
//  FootballApp
//
//  Created by Amr Hesham on 11/22/20.
//  Copyright © 2020 jets. All rights reserved.
//

import Foundation
class Network {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage:String?
    
    func getAllLeagues(completion:@escaping (Leagues) -> Void) {
       let url  = URL(string: "http://api.football-data.org/v2/competitions")
        guard let comptetionsUrl = url else {return}
        
        var request = URLRequest(url: comptetionsUrl)
//        request.setValue("X-Auth-Token", forHTTPHeaderField: "    ec775bfe0f1f4b44bd94227cb623f809")
            // 4
            dataTask =
                defaultSession.dataTask(with: request) { [weak self] data, response, error in
                    defer {
                        self?.dataTask = nil
                    }
                    // 5
                    if let error = error {
                        print(error)
                    } else if
                        let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                        // 6
                        do {
                            let leagues = try JSONDecoder().decode(Leagues.self, from: data)
                            completion(leagues)
                        }catch {
                                print(error)
                        }
                    }
            }
            dataTask?.resume()
        }
    
    
    func getAllTeams(with id:Int, completion:@escaping ( Array<Team> ) -> Void) {
        let url  = URL(string: "http://api.football-data.org/v2/competitions/\(id)/teams")
                guard let comptetionsUrl = url else {return}
                
                var request = URLRequest(url: comptetionsUrl)
                request.setValue("07e8f775859f4a15bbcf02e0f98eb4f4", forHTTPHeaderField: "X-Auth-Token")
                    // 4
                    dataTask =
                        defaultSession.dataTask(with: request) { [weak self] data, response, error in
                            defer {
                                self?.dataTask = nil
                            }
                            // 5
                            if let error = error {
                                print(error)
                            } else if
                                let data = data {
                                // 6
                                do {
                                    let teamsResponse = try JSONDecoder().decode(TeamsResponse.self, from: data)
                                    if let teams = teamsResponse.teams {
                                        completion(teams)
                                    }
                                }catch {
                                        print(error)
                                }
                            }
                    }
                    dataTask?.resume()
                }
    }
