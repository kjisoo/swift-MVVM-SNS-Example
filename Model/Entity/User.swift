//
//  User.swift
//  MVVM-SNS
//
//  Created by A on 03/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

public struct User: Codable {
  public let id: Int
  public let name: String
  public let profileImageURL: URL?
  
  public init(id: Int, name: String, profileImageURL: URL?) {
    self.id = id
    self.name = name
    self.profileImageURL = profileImageURL
  }
}
