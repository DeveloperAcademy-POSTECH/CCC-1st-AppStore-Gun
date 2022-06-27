//
//  SmallAppInfoColumnView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import SwiftUI

enum AppInfoViewSize {
    case small, medium
}

struct AppInfoColumnView: View {
    let ranked: Bool
    let rowSize: AppInfoViewSize
    let appIdRankTuples: [AppIdWithIndex]

    var spacing: CGFloat {
        rowSize == .small ? 5 : 7
    }

    var body: some View {
        VStack(spacing: spacing) {
            ForEach(appIdRankTuples, id: \.id) { appIdWithIndex in
                Group {
                    switch rowSize {
                    case .small:
                        SmallAppInfoView(appId: appIdWithIndex.id, index: appIdWithIndex.index, ranked: ranked)
                    case .medium:
                        MediumAppInfoView(appId: appIdWithIndex.id, index: appIdWithIndex.index)
                    }
                }
            }
            Spacer(minLength: 0)
        }
    }
}

struct SmallAppInfoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoColumnView(ranked: true, rowSize: .small, appIdRankTuples: [
            AppIdWithIndex(id: UUID(), index: 1),
            AppIdWithIndex(id: UUID(), index: 2),
            AppIdWithIndex(id: UUID(), index: 3)
        ]).preferredColorScheme(.dark)
    }
}
