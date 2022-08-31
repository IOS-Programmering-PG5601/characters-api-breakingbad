//
//  ContentView.swift
//  LessonOne
//
//  Created by Stian Ihler Hermansen on 31/08/2022.
//

import SwiftUI

struct Characters: Codable {
    let char_id: Int
    let name: String
    let img: String
    

   
}





struct ContentView: View {
    @State private var values = [Characters]()
  
    var body: some View {
       
        NavigationView {
            List(values, id: \.char_id) { item in
                
                HStack {
                    Image(item.img)
                    Text(item.name)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }.navigationTitle("Characters").task {
                await fetchData()
            }
        }
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



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
