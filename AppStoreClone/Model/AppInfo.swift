//
//  AppInfo.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/24.
//

import Foundation

struct TitleReceiver: Codable {
    let name: String
}

@MainActor
class AppInfo: Identifiable, ObservableObject {
    let id: UUID
    @Published var name = "Default Name"
    @Published var subName = "Default SubName"
    let isInternalPurchaseExists = Int.random(in: 0...1) == 1

    init(id: UUID) {
        self.id = id
    }

    func fetchTitle() async -> String {
        guard let url = URL(string: "https://api.namefake.com/") else {
            return "Failed Title"
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(TitleReceiver.self, from: data).name
        } catch {
            print(error)
            return "Default Title"
        }
    }

    func fetchInfo() async {
        async let title = fetchTitle()
        async let subtitle = fetchTitle()

        self.name = await title
        self.subName = await subtitle
    }
}
