//
//  Suntime.swift
//  WeatherApp
//
//  Created by Izak Bunda on 1/8/23.
//

import SwiftUI

struct Suntime: View {
    var sunrise: Double
    var sunset: Double
    
    var body: some View {
        HStack(spacing: 20) {
            
            HStack{
                Image(systemName: "sunrise")
                    .font(.title2)
                Text(sunrise.dateFormatted(withFormat : "MM-dd-yyyy HH:mm").suffix(5))
                    .bold()
                    .font(.system(size: 20))
            }
            .padding()
            
            Image(systemName: "arrow.right")
            
            HStack{
                Image(systemName: "sunset")
                    .font(.title2)
                Text(sunset.dateFormatted(withFormat : "MM-dd-yyyy HH:mm").suffix(5))
                    .bold()
                    .font(.system(size: 20))
            }
            .padding()
            
            
            
            
//            VStack(alignment: .leading, spacing: 8) {
//                Text(name)
//                    .bold()
//                    .font(.system(size: 20))
//
//
//                Text(value)
//                    .bold()
//                    .font(.title)
//            }
        }
        .frame(width: 320, height: 40)
        .padding()
        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
        .cornerRadius(50)
    }
}

struct Suntime_Previews: PreviewProvider {
    static var previews: some View {
        Suntime(sunrise: 1673189946, sunset: 1673225986) // hardcoded
    }
}
