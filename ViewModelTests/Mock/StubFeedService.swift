//
//  StubFeedService.swift
//  ViewModelTests
//
//  Created by A on 16/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation
import RxSwift
import Model

class StubFeedService: FeedServiceType {
  private lazy var dummyPosts = (0..<100).map(self.createPost)
  
  func posts(page: Int) -> Single<[Post]> {
    let start = page * 20
    let end = (page+1) * 20
    if page >= 5 {
      return Single.just([])
    }
    return Single<[Post]>.just(Array(self.dummyPosts[start..<end]))
  }
  func posts(userID: Int) -> Single<[Post]> {
    return Single<[Post]>.just(self.dummyPosts.filter({$0.owner.id == userID}))
  }
  func post(id: Int) -> Single<Post> {
    return .never()
  }
  func upload(post: Post) -> Completable {
    return .never()
  }

  private func createPost(id: Int) -> Post {
    let user = User(id: id % 10, name: "\(id%10)", profileImageURL: nil)
    return Post(id: id, owner: user, content: "\(id)", likes: [], comments: [], contentImageURL: nil)
  }
}
