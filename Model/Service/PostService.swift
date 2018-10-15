//
//  PostService.swift
//  MVVM-SNS
//
//  Created by A on 06/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation
import RxSwift

public protocol PostServiceType {
  func posts(page: Int) -> Single<[Post]>
  func posts(userID: Int) -> Single<[Post]>
  func post(id: Int) -> Single<Post>
  func upload(post: Post) -> Completable
}
