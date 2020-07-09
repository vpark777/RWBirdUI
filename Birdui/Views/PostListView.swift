//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//
import SwiftUI


struct PostListView: View {
  
  var mediaPosts = PostViewModel()
  
  
  var body: some View {
    
    // TODO: This should look exactly like the Birdie table view,
    // but with only one button.
    NavigationView {
      
      List() {
        ForEach(mediaPosts.posts.indices) { index in
//          print(mediaPosts.posts[index])
          Text("Test \(index)")
        }
      }
      .navigationBarTitle("Posts")
      .navigationBarItems(
        leading: EditButton(),
        trailing:
        Button(action: {
//          self.modalIsPresented = true
        }) {
          Image(systemName: "plus")
        }
      )
      
    }
    
  }
  
}


struct PostListView_Previews: PreviewProvider {
  
  static var previews: some View {
    PostListView(mediaPosts: PostViewModel())
  }
  
}
