//
//  SmallAppInfoColumnView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import SwiftUI

struct SmallAppInfoColumnView: View {
    let ranked: Bool
    let appIdRankTuples: [AppIdWithIndex]

    var body: some View {
        VStack(spacing: 5) {
            ForEach(appIdRankTuples, id: \.id) { appIdWithIndex in
                SmallAppInfoView(appId: appIdWithIndex.id, index: appIdWithIndex.index, ranked: ranked)
            }
            Spacer(minLength: 0)
        }
    }
}

struct SmallAppInfoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoColumnView(ranked: true, appIdRankTuples: [
            AppIdWithIndex(id: UUID(), index: 1),
            AppIdWithIndex(id: UUID(), index: 2),
            AppIdWithIndex(id: UUID(), index: 3)
        ]).preferredColorScheme(.dark)
    }
}
