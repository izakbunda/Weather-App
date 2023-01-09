//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Izak Bunda on 1/8/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                
                VStack(alignment: .leading, spacing: 5 ) {
                    Text(weather.name)
                        .bold()
                        .font(.system(size: 50))
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))") // from iOS15
                        .fontWeight(.light)
                        .font(.system(size: 30))
                }

                Spacer()
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 80))
                            
                            Text(weather.weather[0].description)
                                .bold()
                                .font(.system(size: 20))
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        
                        VStack() {
                            Text(weather.main.temp.roundDouble() + "°")
                                .font(.system(size: 90))
                                .fontWeight(.bold)
                            
                            Text("Feels Like: \(weather.main.temp.roundDouble())°")
                                .font(.system(size: 20))
                        }
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.top, 50)
            
            VStack {
                Spacer()
                
                VStack(alignment: .center) {
                    Text("Current Conditions")
                        .bold()
                        .font(.system(size: 30))
                        .padding()

                    HStack{
                        
                        VStack(alignment: .leading){
                            WeatherRow(logo: "thermometer", name: "Low", value: (weather.main.tempMin.roundDouble() + "°"))
                            WeatherRow(logo: "wind", name: "Wind", value: (weather.wind.speed.roundDouble() + "m/s"))
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .leading){
                            WeatherRow(logo: "thermometer", name: "High", value: (weather.main.tempMax.roundDouble() + "°"))
                            WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        }
                        
                    }
                    .padding(10)
                    
                    VStack{
                        Text("Sunrise and Sunset")
                            .bold()
                            .font(.system(size: 30))
                        Suntime(sunrise: weather.sys.sunrise , sunset: weather.sys.sunset )
                    }
                    .padding()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.527, brightness: 0.6))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.565, saturation: 0.527, brightness: 0.953))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
