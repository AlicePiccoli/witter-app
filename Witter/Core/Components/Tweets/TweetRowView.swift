//
//  TweetRowView.swift
//  Witter
//
//  Created by Alice Piccoli on 20/09/2023.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    let tweet: Tweet
    
    var body: some View {
        // VStack = vertical, HStack horizontal
        VStack(alignment: .leading) {
            
            // Image de profil, informations users, et tweet
            if let user = tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string:user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // Infos utilisateur & tweet
                    VStack(alignment: .leading, spacing: 4) {
                        // Infos utilisateur
                        
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("7min")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        // tweet caption
                        Text(tweet.caption)
                            .font(.subheadline)
                            // Pour éviter que le texte dépasse
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // action buttons
            HStack {
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    // action goes here..
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.purple)
            
            Divider()
        }
        
    }
}

//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//    }
//}
