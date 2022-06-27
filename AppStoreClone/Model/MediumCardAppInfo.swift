//
//  MediumCardAppInfo.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/27.
//

import Foundation

class MediumCardAppInfo: AppInfo {
    @Published var topLabel = "Default Top Label"
    @Published var upperLabel = "Default Upper Label"
    @Published var midLabel = "Default Mid Label"
    @Published var lowerLabel = "Default Lower Label"

    override func fetchInfo() async {
        Task {
            await super.fetchInfo()
        }

        async let topLabel = fetchTitle()
        async let upperLabel = fetchTitle()
        async let midLabel = fetchTitle()
        async let lowerLabel = fetchTitle()

        self.topLabel = await topLabel
        self.upperLabel = await upperLabel
        self.midLabel = await midLabel
        self.lowerLabel = await lowerLabel
    }
}
