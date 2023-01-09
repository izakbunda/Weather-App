//
//  Extensions.swift
//  WeatherApp
//
//  Created by Izak Bunda on 1/8/23.
//

import Foundation
import SwiftUI

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
    
    var dateFormatted : String? {
            let date = Date(timeIntervalSince1970: self)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.none //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.short //Set date style
            return dateFormatter.string(from: date)
         }

        // returns the date formatted according to the format string provided.
        func dateFormatted(withFormat format : String) -> String{
             let date = Date(timeIntervalSince1970: self)
             let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = format
             return dateFormatter.string(from: date)
        }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
