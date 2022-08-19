//
//  HeaderView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct HeaderView: View {
    @State var title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .bold()
                .font(.title)
            
            Text("Today")
                .fontWeight(.light)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "")
    }
}
