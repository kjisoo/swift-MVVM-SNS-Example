//
//  Post.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

public struct Post {
  public let id: Int
  public let owner: User
  public let contentImageURL: URL
  public let content: String
  public let likes: [Like]
  public let comments: [Comment]
}
