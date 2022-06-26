//
//  SmallAppInfoListView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import Combine
import SwiftUI
import SwiftUIPager

struct SmallAppInfoListView: View {
    let ranked: Bool
    let appTupleColumns: [[AppIdWithIndex]]
    @StateObject var page: Page = .first()

    init(appsCount: Int, ranked: Bool) {
        self.ranked = ranked

        var subscriptions = Set<AnyCancellable>()
        var columns = [[AppIdWithIndex]]()

        Array(1...appsCount).map { index in
            AppIdWithIndex(id: UUID(), index: index)
        }
        .publisher
        .collect(3)
        .sink {
            columns.append($0)
        }
        .store(in: &subscriptions)

        appTupleColumns = columns
    }

    var body: some View {
        Pager(page: page,
              data: appTupleColumns,
              id: \.self,
              content: { column in
                SmallAppInfoColumnView(ranked: ranked, appIdRankTuples: column)
            }
        )
        .preferredItemSize(CGSize(width: Constants.screenWidth - 2 * Constants.horizontalMargin, height: 218))
        .itemSpacing(Constants.horizontalMargin / 2)
        .frame(height: 218)
    }
}

struct SmallAppInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoListView(appsCount: 20, ranked: true).preferredColorScheme(.dark)
    }
}
