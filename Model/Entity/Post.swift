//
//  Post.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

public struct Post: Codable {
  public let id: Int
  public let owner: User
  public let content: String
  public let likes: [Like]
  public let comments: [Comment]
  public var contentImageURL: URL?
  
  public init(id: Int, owner: User, content: String, likes: [Like], comments: [Comment], contentImageURL: URL?) {
    self.id = id
    self.owner = owner
    self.content = content
    self.likes = likes
    self.comments = comments
    self.contentImageURL = contentImageURL
  }
}

