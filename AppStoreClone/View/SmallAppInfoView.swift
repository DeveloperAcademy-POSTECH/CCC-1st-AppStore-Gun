//
//  SmallAppInfoView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

struct SmallAppInfoView: View {
    @StateObject private var appInfo: AppInfo

    init(appId: UUID) {
        _appInfo = StateObject(wrappedValue: AppInfo(id: appId))
    }

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(width: 62, height: 62)

            VStack(alignment: .leading, spacing: 6) {
                Text(appInfo.name)
                    .font(.subheadline)
                Text(appInfo.subName)
                    .font(.caption)
                    .foregroundColor(Color(.lightGray))
            }

            Spacer()

            DownloadButton(hasPurchase: appInfo.hasInternalPurchase)
        }
        .frame(width: Constants.screenWidth - Constants.horizontalMargin * 2)
        .task {
            await appInfo.fetchInfo()
        }
    }
}

struct SmallAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoView(appId: UUID()).preferredColorScheme(.dark)
    }
}
