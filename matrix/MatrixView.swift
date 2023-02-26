//
//  ContentView.swift
//  matrix
//
//  Created by Kirill Kirilenko on 26.02.2023.
//

import SwiftUI

struct MatrixView: View {
    var body: some View {
        HStack {
            ForEach(0...18, id: \.self) { _ in
                MatrixLineView()
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MatrixView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixView()
    }
}
