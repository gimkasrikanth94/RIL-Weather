//
//  TimeLogoView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct TimeLogoView: View {
    @State var isSunTheme: Bool?
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        VStack( spacing: 5) {
            if isSunTheme == true{
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
            }else{
                if let url = URL(string: "https://openweathermap.org/img/w/\(logo).png"){

                AsyncImage(
                   url: url,
                   placeholder: { ProgressView() },
                   image: { Image(uiImage: $0).resizable() }
                ).aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                }else{
                    Color.gray
                        .frame(width: 40, height: 40)

                }
            }
            VStack( spacing: 8) {
                Text(name)
                    .font(.body)
                Text(value)
                    .bold()
                    .font(.headline)
            }
        }
    }
}






struct TimeLogoView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLogoView(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
