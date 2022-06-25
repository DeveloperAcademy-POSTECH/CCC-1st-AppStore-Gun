//
//  SmallAppInfoView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/25.
//

import SwiftUI

struct SmallAppInfoView: View {
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
                Text("리그 오브 레전드: 와일드 리프트")
                    .font(.subheadline)
                Text("5:5 MOBA 전투를 위한\n팀을 구성하세요")
                    .font(.caption)
                    .foregroundColor(Color(.lightGray))
            }
            
            Spacer()
            
            DownloadButton(hasPurchase: false)
        }
        .frame(width: Constants.screenWidth - Constants.horizontalMargin * 2)
    }
}

struct SmallAppInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SmallAppInfoView().preferredColorScheme(.dark)
    }
}
