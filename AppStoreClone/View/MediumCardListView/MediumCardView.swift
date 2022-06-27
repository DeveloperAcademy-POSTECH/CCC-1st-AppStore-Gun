//
//  MediumCardView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/27.
//

import SwiftUI

struct MediumCardView: View {
    var totalWidth: CGFloat {
        Constants.screenWidth - 2 * Constants.horizontalMargin
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("현재 진행 중")
                .font(.caption2)
                .foregroundColor(.blue)
            ZStack(alignment: .leading) {
                RandomImage(cornerRadius: 10)
                    .frame(width: totalWidth, height: 280)
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        Spacer(minLength: 0)
                        Text("특별 이벤트")
                            .font(.caption2)
                            .foregroundColor(Color(.lightGray))
                        Text("대학생 서포터즈 활동: AR필터 공모전")
                        Text("나만의 필터를 세상에 알리세요!")
                            .font(.caption2)
                            .foregroundColor(Color(.lightGray))
                            .padding(.bottom, 6)
                    }
                    .padding(.horizontal, 16)
                    ZStack {
                        Rectangle()
                            .frame(width: totalWidth, height: 60)
                            .foregroundColor(Color(.systemGray6))
                        HStack(spacing: 10) {
                            RandomImage(cornerRadius: 5)
                                .frame(width: 40, height: 40)
                            VStack(alignment: .leading, spacing: 4) {
                                Text("TikTok 틱톡")
                                    .font(.caption)
                                Text("15초만에 사로잡는 재밌는 영상이 가득합니다.")
                                    .font(.caption2)
                                    .foregroundColor(Color(.lightGray))
                                    .lineLimit(1)
                            }
                            Spacer(minLength: 0)
                            DownloadButtonStack(hasPurchase: true, isBright: false, direction: .vertical)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .frame(width: totalWidth)
            }
            .frame(height: 280)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

struct MediumCardView_Previews: PreviewProvider {
    static var previews: some View {
        MediumCardView().preferredColorScheme(.dark)
    }
}
