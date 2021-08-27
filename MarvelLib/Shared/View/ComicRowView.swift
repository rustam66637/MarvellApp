//
//  ComicRowView.swift
//  MarvelLib
//
//  Created by wozdabady on 27.08.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicsView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsView()
    }
}

struct ComicRowView: View {
    
    var comic: Comic
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 15) {
            
            WebImage(url: self.extractImage(data: comic.thumbnail))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text(comic.title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                // if description not nil
                if let description = comic.description {
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(4)
                        .multilineTextAlignment(.leading)
                }
                
                //links
                HStack(spacing: 10){
                    ForEach(comic.urls, id: \.self){ data in
                        
                        NavigationLink(
                            destination: WebView(url: extractURL(data: data))
                                .navigationTitle(extractURLType(data: data))){
                            Text(extractURLType(data: data))
                        }
                    }
                }
            })
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
    }
    
    
    func extractImage(data: [String: String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        
        return URL(string: "\(path).\(ext)")!
    }
    
    
    func extractURL(data: [String: String]) -> URL {
        let url = data["url"] ?? ""
        
        return URL(string: url)!
    }
    
    
    func extractURLType(data: [String:String]) -> String {
        let urlType = data["type"] ?? ""
        
        return urlType.capitalized
    }
}

