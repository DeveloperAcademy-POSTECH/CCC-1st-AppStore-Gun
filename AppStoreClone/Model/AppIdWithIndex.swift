//
//  AppIdWithIndex.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import Foundation

struct AppIdWithIndex: Equatable, Hashable {
    let id: UUID
    let index: Int
}
