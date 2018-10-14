//
//  Identifiable.swift
//  MVVM-SNS
//
//  Created by A on 11/10/2018.
//  Copyright © 2018 Kimjisoo. All rights reserved.
//

import Foundation

protocol Identifiable {
  associatedtype IDType: Comparable
  var id: IDType { get }
}
