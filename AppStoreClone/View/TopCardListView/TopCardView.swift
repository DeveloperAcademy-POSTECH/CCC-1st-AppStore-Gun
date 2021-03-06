//
//  TopCardView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/23.
//

import SwiftUI

struct TopCardView: View {
    @StateObject private var topCardAppInfo: TopCardAppInfo

    init(appId: UUID) {
        _topCardAppInfo = StateObject<TopCardAppInfo>(wrappedValue: TopCardAppInfo(id: appId))
    }

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(topCardAppInfo.cardLabel)
                        .foregroundColor(.blue)
                        .font(.caption)
                    Text(topCardAppInfo.name)
                        .font(.title2)
                    Text(topCardAppInfo.cardSubtitle)
                        .foregroundColor(Color(.systemGray))
                        .font(.title3)
                }
                Spacer()
            }
            ZStack {
                RandomImage(cornerRadius: 5)
                VStack {
                    Spacer()
                    HStack {
                        AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .frame(width: 37, height: 37)
                        VStack(alignment: .leading) {
                            Text(topCardAppInfo.name)
                                .font(.caption)
                                .foregroundColor(.white)
                            Text(topCardAppInfo.subName)
                                .font(.caption2)
                                .foregroundColor(Color(.lightGray))
                        }
                        .padding(.bottom, 2)
                        Spacer()
                        DownloadButtonStack(hasPurchase: topCardAppInfo.hasInternalPurchase,
                                            isBright: true,
                                            direction: .vertical)
                    }
                    .padding(.horizontal, 14)
                    .padding(.bottom, 9)
                }
            }
            .frame(height: Constants.screenHeight * (224 / 844))
        }
        .frame(width: Constants.screenWidth * (350 / 390))
        .task {
            await topCardAppInfo.fetchInfo()
        }
    }
}

struct TopCardView_Previews: PreviewProvider {
    static var previews: some View {
        TopCardView(appId: UUID())
            .preferredColorScheme(.dark)
            .padding(.horizontal, Constants.horizontalMargin)
    }
}
