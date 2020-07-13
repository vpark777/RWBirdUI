//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//
import SwiftUI


struct PostView: View {
  
  @ObservedObject var postViewModel: PostViewModel
   
  var body: some View {
    // Post cell
    List {
       // ForEach(postViewModel.posts, id:\.self){ post in
        //VP change in loop to get index needed for function to PostViewModel
        
      ForEach(Array(postViewModel.posts.enumerated()), id: \.1.id){(index, post) in
        VStack(alignment:.leading) {
          // Post header: post icon, username and date
          HStack {
            Image("mascot_swift-badge")
              .resizable()
              .frame(width: 50, height: 50)
            
            VStack(alignment: .leading, spacing: 5) {
              Text("\(post.userName)")
                .font(.headline)
              
              Text(post.timestamp.toString())
                .font(.subheadline)
            }
          }
          
          // Post body test
          Text("\(post.textBody!)")
            .font(.body)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //VP added fixed size
            //otherwise multiline text
            //got cut off
            .fixedSize(horizontal:false, vertical:true)
          // VP
          if post.uiImage != nil {
            HStack {
              Spacer()
              
              Image(uiImage: post.uiImage!)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 200, alignment: .center)
              
              Spacer()
            }//HStack
          }//if image not null
            
            ////VP adding heart like icon
            HStack(alignment: .center){
                Spacer()
                Image(post.heartImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20, alignment:.center)
                Spacer()
            }
            ///VP changes
        } //VStack main
        .padding(.vertical, 7.5)
        //VP Adding tapGesture
         .onTapGesture{
         self.postViewModel.changeHeart(posts:self.postViewModel.posts,index:index)
        }
        
        }//foreach
        
    }//list
    
  }//body
  
}//struct


struct PostView_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      PostView(postViewModel: PostViewModel())
      PostView(postViewModel: PostViewModel())
        .preferredColorScheme(.dark)
    }
  }
  
}
