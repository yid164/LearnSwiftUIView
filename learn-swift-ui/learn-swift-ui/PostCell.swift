//
//  PostCell.swift
//  learn-swift-ui
//
//  Created by Yinsheng Dong on 2020-07-21.
//  Copyright © 2020 yinshengdong. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    let post: Post
    
    var body: some View {
        HStack(spacing: 5){
            
            Image(uiImage: UIImage(named:post.avatar)!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(
                    PostVIPBadge(vip: post.vip)
                    .offset(x: 16, y:16)
                )
            
            
            VStack(alignment: .leading, spacing: 5){
                Text(post.name)
                    .font(Font.system(size:16))
                    .foregroundColor(Color(red:242/255, green:99/255, blue: 4/255))
                    .lineLimit(1)
                
                Text(post.date)
                    .font(.system(size:11))
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            if !post.isFollowed{
                Spacer()
                
                Button(action:{
                    print("Click follow button")
                }){
                    Text("Follow")
                        .font(.system(size:14))
                        .foregroundColor(.orange)
                        .frame(width: 50, height:26)
                        .overlay(RoundedRectangle(cornerRadius: 13)
                            .stroke(Color.orange, lineWidth: 1))
                }
            }
            
        }
        
        
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: postList.list[0])
    }
}


