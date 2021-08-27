//
//  CharacterRowView.swift
//  MarvelLib
//
//  Created by wozdabady on 27.08.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterRowView: View {
    
    var character: Character
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 15) {
            
            WebImage(url: self.extractImage(data: character.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(character.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                
                //links
                HStack(spacing: 10) {
                    
                    ForEach(character.urls, id: \.self){ data in
                        
                        NavigationLink(
                            destination: WebView(url: extractURL(data: data))
                                .navigationTitle(extractURLType(data: data))){
                                Text(extractURLType(data: data))
                            }
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }
    
    
    func extractImage(data: [String: String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        //fetch image url
        return URL(string: "\(path).\(ext)")!
    }
    
    
    func extractURL(data: [String: String]) -> URL {
        let url = data["url"] ?? ""
        //fetch url
        return URL(string: url)!
    }
    
    
    func extractURLType(data: [String:String]) -> String {
        let urlType = data["type"] ?? ""
        //fetch image url type
        return urlType.capitalized
    }
}
