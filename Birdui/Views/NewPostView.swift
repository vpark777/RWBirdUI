//
//  NewPostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//
import SwiftUI


struct NewPostView: View {
  
  var postViewModel: PostViewModel
  @Environment(\.presentationMode) var presentationMode
  
  @State var username: String = ""
  @State var postText: String = ""
  @State var showImagePicker = false
  @State var uiImage: UIImage?
  @State var inputImage:UIImage?
    
  let imageSize: CGFloat = 200
  
  
  var body: some View {
    VStack {
      Text("New Post")
        .font(.headline)
      Form {
        TextField("Username", text: $username)
        Button("Pick image") {
          self.showImagePicker = true
        }
        if uiImage != nil {
          Image(uiImage: uiImage!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageSize, height: imageSize)
        }
        TextField("Post text", text: $postText)
      }
      HStack {
        Button("Cancel") {
          self.presentationMode.wrappedValue.dismiss()
        }
        Spacer()
        Button("Post") {
          self.postViewModel.addPost(post: MediaPost(textBody: self.postText, userName: self.username, timestamp: Date(), uiImage: self.uiImage))
          self.presentationMode.wrappedValue.dismiss()
        }
        .disabled(username.isEmpty && postText.isEmpty)
      }
      .padding()
    }
    .sheet(isPresented: $showImagePicker) {
      // TODO: Show ImagePicker
         ImagePicker(image:self.$uiImage)
    }
  }
  func loadImage(){
      guard let inputImage = inputImage else {return}
      uiImage = inputImage
  }
}


struct NewPostView_Previews: PreviewProvider {
  
  static var previews: some View {
    Group {
      NewPostView(postViewModel: PostViewModel())
      NewPostView(postViewModel: PostViewModel())
        .preferredColorScheme(.dark)
    }
  }
  
}
