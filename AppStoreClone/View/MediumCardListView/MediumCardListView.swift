//
//  MediumCardListView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/27.
//

import SwiftUI
import SwiftUIPager

struct MediumCardListView: View {
    @StateObject var page: Page = .first()
    var items = Array(0..<10).map { _ in UUID() }

    var pagerWidth: CGFloat {
        Constants.screenWidth - 2 * Constants.horizontalMargin
    }

    var pagerHeight: CGFloat {
        Constants.screenHeight * (280 / 844) + 20
    }

    var body: some View {
        Pager(page: page,
              data: items,
              id: \.self,
              content: { MediumCardView(appId: $0)
         })
        .preferredItemSize(CGSize(width: pagerWidth, height: pagerHeight))
        .itemSpacing(Constants.horizontalMargin / 2)
        .frame(height: pagerHeight)
    }
}

struct MediumCardListView_Previews: PreviewProvider {
    static var previews: some View {
        MediumCardListView().preferredColorScheme(.dark)
    }
}
