//
//  SmallAppInfoListView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/26.
//

import Combine
import SwiftUI
import SwiftUIPager

struct AppInfoListView: View {
    let ranked: Bool
    let appTupleColumns: [[AppIdWithIndex]]
    let rowSize: AppInfoViewSize
    @StateObject var page: Page = .first()

    var totalHeight: CGFloat {
        rowSize == .small ? 218 : 194
    }

    init(appsCount: Int, ranked: Bool, rowSize: AppInfoViewSize) {
        self.ranked = ranked
        self.rowSize = rowSize

        var subscriptions = Set<AnyCancellable>()
        var columns = [[AppIdWithIndex]]()

        Array(1...appsCount).map { index in
            AppIdWithIndex(id: UUID(), index: index)
        }
        .publisher
        .collect(rowSize == .small ? 3 : 2)
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
            AppInfoColumnView(ranked: ranked, rowSize: rowSize, appIdRankTuples: column)
            }
        )
        .preferredItemSize(CGSize(width: Constants.screenWidth - 2 * Constants.horizontalMargin, height: totalHeight))
        .itemSpacing(Constants.horizontalMargin / 2)
        .frame(height: totalHeight)
    }
}

struct SmallAppInfoListView_Previews: PreviewProvider {
    static var previews: some View {
        AppInfoListView(appsCount: 20, ranked: false, rowSize: .medium).preferredColorScheme(.dark)
    }
}
