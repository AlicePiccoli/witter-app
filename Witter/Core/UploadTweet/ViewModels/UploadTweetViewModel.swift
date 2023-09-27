//
//  UploadTweetViewModel.swift
//  Witter
//
//  Created by m1 on 26/09/2023.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    @Published var didUploadTweet = false
    
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                // dismiss screen
                self.didUploadTweet = true
            } else {
                // show message error to user
            }
        }
    }
}
