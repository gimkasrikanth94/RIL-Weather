//
//  RisingView.swift
//  RIL Weather
//
//  Created by Srikanth Gimka on 18/08/22.
//

import SwiftUI

struct RisingView: View {
    @State var city: City?
    var body: some View {
        HStack{
            TimeLogoView(isSunTheme: true, logo: "sunrise", name: "Sun Rise", value: city?.sunrise?.convertToTime() ?? "")
            Spacer()
                .frame(width: UIScreen.width*0.1)
            TimeLogoView(isSunTheme: true, logo: "sunset", name: "Sun Set", value: city?.sunset?.convertToTime() ?? "")
        }
    }
}

struct RisingView_Previews: PreviewProvider {
    static var previews: some View {
        RisingView()
    }
}
