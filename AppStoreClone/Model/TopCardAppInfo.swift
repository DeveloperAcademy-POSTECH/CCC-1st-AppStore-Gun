//
//  TopCardAppInfo.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import Foundation

@MainActor
class TopCardAppInfo: AppInfo {
    @Published var cardLabel = "Default Card Title"
    @Published var cardSubtitle = "Default Card Subtitle"

    override func fetchInfo() async {
        Task {
            await super.fetchInfo()
        }
        async let cardTitle = fetchTitle()
        async let cardSubtitle = fetchTitle()

        self.cardLabel = await cardTitle
        self.cardSubtitle = await cardSubtitle
    }
}
