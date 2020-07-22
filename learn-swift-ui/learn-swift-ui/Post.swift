//
//  Post.swift
//  learn-swift-ui
//
//  Created by Yinsheng Dong on 2020-07-21.
//  Copyright © 2020 yinshengdong. All rights reserved.
//

import SwiftUI

struct PostList: Codable{
    let list: [Post]
}

// model
struct Post: Codable{
    let avatar: String //avatar
    let vip: Bool
    let name: String
    let date: String
    var isFollowed: Bool
    let text: String
    let images :[String]
    var commentCount: Int
    var likeCount: Int
    var isLiked: Bool
}

func loadPostListData(_ fileName:String) -> PostList{
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("Can not find \(fileName) in main bundle")
    }
    
    guard let data = try?Data(contentsOf: url) else {fatalError("Can not load \(url)")}
    
    guard let list = try?JSONDecoder().decode((PostList.self), from: data) else { fatalError("Can not parse post list json data")}
    
    return list
    
}


let postList = loadPostListData("PostListData_recommend_1.json")



