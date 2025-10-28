//
//  Sttepper.swift
//  HACOHub
//
//  Created by user on 2025/10/28.
//

import SwiftUI

struct Stepper: View {
    let steps: [String]
    let completeNumber: Int

    var body: some View {
        HStack(spacing: 12) {
            ForEach(steps.indices, id: \.self) { index in
                HStack(spacing: 6) {
                    // 丸い番号 or チェックマーク
                    ZStack {
                        
                        Circle()
                            .fill(index < completeNumber ? (Color(red: 79/255, green: 190/255, blue: 150/255, opacity: 1)) : Color.gray.opacity(0.3))
                            .frame(width: 24, height: 24)
                            
                        if index < completeNumber {
                            Image(systemName: "checkmark")
                                .foregroundColor(.white)
                        } else if index == completeNumber{
                            Circle()
                                .stroke((Color(red: 79/255, green: 190/255, blue: 150/255, opacity: 1)), lineWidth: 1.5)
                                .frame(width: 30, height: 30)
                            Circle()
                                .fill((Color(red: 79/255, green: 190/255, blue: 150/255, opacity: 1)))
                                .frame(width: 24, height: 24)
                            Text("\(index + 1)")
                                .foregroundColor(.white)
                                .font(.custom("SFPro-Regular", size: 12))
                        } else {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 24, height: 24)
                            Text("\(index + 1)")
                                .foregroundColor(.white)
                                .font(.custom("SFPro-Regular", size: 12))
                                
                            
                        }
                        
                    }
                    
                    // ステップ名
                    Text(steps[index])
                            .font(.custom(index == completeNumber
                                  ? "SFPro-Bold"
                                  : "SFPro-Regular",
                                  size: 14))
                            .foregroundColor(.black)
                            .fixedSize()
                    // 区切り線（最後以外）
                    if index < steps.count - 1 {
                        Rectangle()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 30, height: 2)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
}

#Preview {
    Stepper(
        steps: ["Locker", "Location", "Payment"], // ✅ 初期化ここで
        completeNumber: 1                    // ✅ 完了ステップ数
    )
}
