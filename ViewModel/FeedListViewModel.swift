//
//  FeedListViewModel.swift
//  MVVM-SNS
//
//  Created by A on 06/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation
import Model

public class FeedListViewModel: BaseViewModel {
  // MARK: Dynamic Properties
  dynamic var feeds: [FeedViewModel] = []
  
  // MARK: Private properties
  private let feedService: FeedServiceType
  
  init(feedService: FeedServiceType) {
    self.feedService = feedService
  }
}
