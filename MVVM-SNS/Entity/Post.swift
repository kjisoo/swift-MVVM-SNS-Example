//
//  Post.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

struct Post {
  let id: Int
  let owner: User
  let contentImageURL: URL
  let content: String
  let likes: [Like]
  let comments: [Comment]
}
