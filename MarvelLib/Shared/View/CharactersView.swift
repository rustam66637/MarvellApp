//
//  CharactersView.swift
//  MarvelLib
//
//  Created by wozdabady on 26.08.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharactersView: View {
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false, content: {
                
                VStack(spacing:15) {
                    //Search bar
                    HStack(spacing: 10) {
                        // search icon
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        // search TF
                        TextField("Search Character", text: $homeData.searchQuery)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                }
                    .padding()
                    
                    if let characters = homeData.fetchedCharacters {
                        if characters.isEmpty {
                            Text("No results found")
                                .padding(.top, 20)
                        } else {
                            //display results
                            ForEach(characters) { data in
                                CharacterRowView(character: data)
                            }
                        }
                    } else {
                        if homeData.searchQuery != "" {
                            //loading screen
                            ProgressView()
                                .padding(.top, 20)
                        }
                    }
                })
            .navigationTitle("Marvel characters")
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CharacterRowView: View {
    var character: Character
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 15) {
            WebImage(url: self.extractImage(data: character.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
            VStack(alignment: .leading, spacing: 8, content: {
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(character.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
            })
            Spacer(minLength: 0)
        }
        
    }
    func extractImage(data: [String: String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        
        return URL(string: "\(path).\(ext)")!
    }
}
