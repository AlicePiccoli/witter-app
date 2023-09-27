//
//  ProfileView.swift
//  Witter
//
//  Created by Alice Piccoli on 20/09/2023.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject var viewModel: ProfileViewModel
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {

            headerView
            
            actionButtons
            
            UserInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString,
                               username: "fireweasley",
                               fullname: "Fred Weasley",
                               profileImageUrl: "",
                               email:"fredw@gmail.com"))
    }
}

// Pour éviter d'avoir le "body" surchargé, on fait une extension du header juste ici pour que ce soit plus lisible
extension ProfileView {
   
    var headerView: some View {
        // Ztack : pour qu'on puisse faire passer des choses par dessus
        ZStack(alignment: .bottomLeading) {
            Color(.systemPurple)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 5)
                }
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }

        }
        .padding(.trailing)
    }
    
    var UserInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Loving Hogwarts")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "location")
                    
                    Text("Hoggwarts, SCT")
                }
                
                HStack {
                    Image(systemName: "link")
                    
                    Text("www.the-chosen-one.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
                .padding(.vertical)
            
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        // On récupère chaque cases de l'enum TweetFilter.. et on peut faire un allCases via la CaseIterable définie sur ce même enum. Et on récupère les cases en array.
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        // Prend en compte l'item actuel et change la font s'il est sélectionné ou non.
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        // Pareil ici , si l'item est sélectionné ça sera en noir sinon en gris.
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemPurple))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.tweets) { tweet in
                    TweetRowView(tweet: tweet)
                        .padding()
                }
            }
        }
    }
}
