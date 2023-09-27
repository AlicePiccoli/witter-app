//
//  TweetFilterViewModel.swift
//  Witter
//
//  Created by Alice Piccoli on 21/09/2023.
//

import Foundation


// CaseIterable nous permet de récupérer toutes les cases de cet enum, 
enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
