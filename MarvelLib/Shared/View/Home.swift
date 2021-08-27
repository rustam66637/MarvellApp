//
//  Home.swift
//  MarvelLib
//
//  Created by wozdabady on 26.08.2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        
        TabView {
            CharactersView()
                .tabItem {
                    Image(systemName: "person.2.circle.fill")
                    Text("Characters")
                }
                //settings enviroment obj.
                //access to data on character view
                .environmentObject(homeData)
            
            Text("Comics")
                .tabItem {
                    Image(systemName: "book.circle.fill")
                    Text("Comics")
                }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
