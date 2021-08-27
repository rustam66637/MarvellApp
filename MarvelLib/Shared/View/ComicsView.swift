//
//  ComicsView.swift
//  MarvelLib
//
//  Created by wozdabady on 27.08.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ComicsView: View {
    
    @EnvironmentObject var homeData: HomeViewModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                if homeData.fetchedComics.isEmpty {
                    ProgressView()
                        .padding(.top, 30)
                }
                else {
                    //display
                    VStack(spacing: 15) {
                        
                        ForEach(homeData.fetchedComics) { comic in
                            ComicRowView(comic: comic)
                        }
                        
                        //infinity scroll
                        if homeData.offset == homeData.fetchedComics.count {
                            //showing progress and fetching new data
                            ProgressView()
                                .padding(.vertical)
                                .onAppear(perform: {
                                    print("fetching new data")
                                    homeData.fetchComics()
                                })
                        }
                        else {
                            GeometryReader(content: { reader -> Color in
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / 1.3
                                //upd
                                if !homeData.fetchedComics.isEmpty && minY < height {
                                    DispatchQueue.main.async {
                                        //setting offset to current fetched comics count
                                        homeData.offset = homeData.fetchedComics.count
                                    }
                                }
                                return Color.clear
                            })
                            .frame(width: 20, height: 20)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Marvel Comics")
        }
        //loading data
        .onAppear(perform: {
            if homeData.fetchedComics.isEmpty {
                homeData.fetchComics()
            }
        })
    }
}

