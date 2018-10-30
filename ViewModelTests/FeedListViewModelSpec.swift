//
//  FeedListViewModelSpec.swift
//  ViewModelTests
//
//  Created by A on 16/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Quick
import Nimble

@testable import ViewModel

class FeedListViewModelSpec: QuickSpec {

  override func spec() {
    var feedListViewModel: FeedListViewModel!
    
    beforeEach {
       feedListViewModel = FeedListViewModel(feedService: StubFeedService())
    }
    
    context("Load feeds") {
      it("Load default page when viewmodel is generated") {
        // Assert
        expect(feedListViewModel.feeds.count).toEventually(equal(20))
      }
    }
  }
}
