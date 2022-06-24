//
//  TopCardView.swift
//  AppStoreClone
//
//  Created by 김남건 on 2022/06/23.
//

import SwiftUI

struct TopCardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("현재 진행 중")
                        .foregroundColor(.blue)
                        .font(.caption)
                    Text("리그 오브 레전드 : 와일드 리프트")
                        .font(.title2)
                    Text("파이크와 노틸러스 등장!")
                        .foregroundColor(Color(.systemGray))
                        .font(.title3)
                }
                Spacer()
            }
            ZStack {
                AsyncImage(url: URL(string: "https://source.unsplash.com/random")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(RoundedRectangle(cornerRadius: 5))
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
                            Text("리그 오브 레전드 : 와일드 리프트")
                                .font(.caption)
                                .foregroundColor(.white)
                            Text("5:5 MOBA 전투를 위한 팀을 구성하세요.")
                                .font(.caption2)
                                .foregroundColor(Color(.lightGray))
                        }
                        .padding(.bottom, 2)
                        Spacer()
                        VStack(spacing: 5) {
                            Button {
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(.white.opacity(0.5))
                                    Text("받기")
                                        .font(.system(size: 14))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 74, height: 29)
                            }
                            Text("앱 내 구입")
                                .font(.system(size: 9))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal, 14)
                    .padding(.bottom, 9)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * (224 / 844))
        }
        .frame(maxWidth: .infinity)
    }
}

struct TopCardView_Previews: PreviewProvider {
    static var previews: some View {
        TopCardView()
            .preferredColorScheme(.dark)
            .padding(.horizontal, 16)
    }
}
