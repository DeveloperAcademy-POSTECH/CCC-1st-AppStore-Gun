//
//  TopCardListView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI
import SwiftUIPager

struct TopCardListView: View {
    @StateObject var page: Page = .first()
    var items = Array(0..<10).map { _ in UUID() }

    var pagerHeight: CGFloat {
        Constants.screenHeight * (224 / 844) + 72
    }

    var body: some View {
        Pager(page: page,
              data: items,
              id: \.self,
              content: { TopCardView(appId: $0)
         })
        .preferredItemSize(CGSize(width: 350, height: pagerHeight))
        .itemSpacing(Constants.horizontalMargin / 2)
        .frame(height: pagerHeight)
    }
}

struct TopCardListView_Previews: PreviewProvider {
    static var previews: some View {
        TopCardListView().preferredColorScheme(.dark)
    }
}
