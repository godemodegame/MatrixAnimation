//
//  MatrixLineView.swift
//  matrix
//
//  Created by Kirill Kirilenko on 26.02.2023.
//

import SwiftUI

struct MatrixLineView: View {
    let randomString: String = {
        let constantString = "abcdefghijklmnopqrstuvwxyz1234567890"
        return String(
            constantString.compactMap { _ in
                constantString.randomElement()
            }
        )
    }()

    @State var animation = false


    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            VStack(alignment: .leading, spacing: 2) {
                ForEach(0..<randomString.count, id: \.self) { index in
                    let randomCharacter = Array(randomString)[index]
                    Text(String(randomCharacter))
                        .foregroundColor(.green)
                }
            }.mask {
                LinearGradient(
                    colors: [.clear, .clear, .black],
                    startPoint: .top,
                    endPoint: .bottom
                ).offset(y: animation ? size.height : -(size.height))
            }
        }
        .onAppear {
            withAnimation(
                .linear(duration: 5)
                .delay(.random(in: 0...5))
                .repeatForever(autoreverses: false)
            ) {
                animation = true
            }
        }
    }
}

struct MatrixLineView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixLineView()
            .background(Color.black)
    }
}
