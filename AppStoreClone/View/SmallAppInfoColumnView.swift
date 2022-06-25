//
//  SmallAppInfoColumnView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import SwiftUI

struct SmallAppInfoColumnView: View {
    let ranked: Bool
    let appIdRankTuples: [(UUID, Int)]

    var body: some View {
        VStack(spacing: 5) {
            ForEach(appIdRankTuples, id: \.0) { id, index in
                SmallAppInfoView(appId: id, index: index, ranked: ranked)
            }
        }
    }
}

struct SmallAppInfoColumnView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoColumnView(ranked: true, appIdRankTuples: [
            (UUID(), 1),
            (UUID(), 2),
            (UUID(), 3)
        ]).preferredColorScheme(.dark)
    }
}
