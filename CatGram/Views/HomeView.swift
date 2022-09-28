//
//  ContentView.swift
//  CatGram
//
//  Created by Vova on 26/09/2022.
//

import SwiftUI


struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                LazyVStack {
                    ForEach($vm.posts) { post in
                        PostView(post: post.wrappedValue)
                            .onAppear {
                                vm.postAppeared(post)
                            }
                            .padding(.top, 60)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
