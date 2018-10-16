//
//  Comment.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

public struct Comment: Codable {
  public let id: Int
  public let owner: User
  public let content: String
}
