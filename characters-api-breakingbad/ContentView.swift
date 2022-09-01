//
//  ContentView.swift
//  LessonOne
//
//  Created by Stian Ihler Hermansen on 31/08/2022.
//

import SwiftUI


struct ContentView: View {
    @StateObject var fetchCharacter = FetchCharacters()
  
    var body: some View {
       
        NavigationView {
            List(fetchCharacter.values, id: \.char_id) { item in
                
                HStack {
                   
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.title3).bold()
                        .foregroundColor(.secondary)
                        Text(item.nickname)
                        Spacer()
                        Text(item.status).foregroundColor(.secondary)
                    }
                    Image(item.img).resizable().aspectRatio(contentMode: .fit)
                }
            }.navigationTitle("Characters").task {
                await fetchCharacter.fetchData()
            }
        }
        }

  
    
   

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
