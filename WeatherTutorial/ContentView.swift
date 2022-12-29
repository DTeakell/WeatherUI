//
//  ContentView.swift
//  WeatherTutorial
//
//  Created by Dillon Teakell on 9/30/22.
//
import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            //Background
            BackgroundView(topColor: isNight ? Color("Gray") : Color("LightBlue"),
                           bottomColor: isNight ? Color("Black") : Color(.white))
            //Today View
            VStack {
                TodayView(cityName: "Santa Clara",
                          provinceName: "CA",
                          weatherIconName: isNight ? "cloud.fill" : "cloud.sun.fill",
                          currentTemperature: isNight ? 69 : 71)
                
                //List of Days View
                HStack {
                    ListOfDaysView(day: "MON",
                                   weatherIcon: "wind",
                                   temperature: 71)
                    
                    ListOfDaysView(day: "TUE",
                                   weatherIcon: "cloud.fill",
                                   temperature: 71)
                    
                    ListOfDaysView(day: "WED",
                                   weatherIcon: "cloud.rain.fill",
                                   temperature: 68)
                    
                    ListOfDaysView(day: "THU",
                                   weatherIcon: "sun.max.fill",
                                   temperature: 74)
                    
                    ListOfDaysView(day: "FRI",
                                   weatherIcon: "cloud.fill",
                                   temperature: 72)
                }
                .background(in: RoundedRectangle(cornerRadius: 20))
                .backgroundStyle(isNight ? Color("UIDarkGray") : Color("UILightBlue"))
                .padding()
                
                Spacer()
                
                Button {
                    isNight.toggle()
                }
                
            label: {
                Text("Change Time of Day")
                    .frame(width: 250, height: 60)
                    .background(Color.white)
                    .font(.system(size: 20, weight: .semibold))
                    .cornerRadius(10)
            }
                
                Spacer()
            }
        }
    }
}
       
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct TodayView: View {
    var cityName: String
    var provinceName: String
    var weatherIconName: String
    var currentTemperature: Int
    
    var body: some View {
        VStack {
            Text("\(cityName), \(provinceName)")
                .padding()
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundColor(.white)
            
            Image(systemName: weatherIconName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
               
            Text("\(currentTemperature)º")
                .foregroundColor(.white)
                .font(.system(size: 60))
                .fontWeight(.regular)
        }
        Spacer()
    }
}

struct ListOfDaysView: View {
    var day: String
    var weatherIcon: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Image(systemName: weatherIcon)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35, height: 35)
            Text("\(temperature)º")
                .font(.custom("", size: 23))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
        .padding()
    }
}



