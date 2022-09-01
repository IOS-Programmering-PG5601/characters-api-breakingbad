//
//  FetchCharacters.swift
//  characters-api-breakingbad
//
//  Created by Stian Ihler Hermansen on 01/09/2022.
//

import Foundation

class FetchCharacters: ObservableObject {
    @Published  var values = [Characters]()
    
    struct Characters: Codable {
        let char_id: Int
        let name: String
        let status: String
        let nickname: String
        let img: String
    }
    
    func fetchData() async {
        // Hent url
        guard let url = URL(string: "https://breakingbadapi.com/api/characters") else {
          print("This url is unfortunately not working at this time")
            return
        }
        // fetch data fra urlen
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let response = try? JSONDecoder().decode([Characters].self, from: data) {
                values = response
            }
        }
        catch {
            print("Data not valid")
        }
        // decode denne dataen
    }
}
