//
//  ContentView.swift
//  APICallTest
//
//  Created by Meghna Vyas on 23/04/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var response: String = "" // for API response
    var body: some View {
        NavigationView{
            VStack {
                Text(response)
                    .padding()
                
                NavigationLink(
                    destination:LineChartView(chartData: chartData).navigationBarHidden(true),
                    label: {
                        Text("View Chart")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding()
                    })
                .navigationBarHidden(true)
                
                NavigationLink(
                    destination:DashboardView().navigationBarHidden(true),
                    label: {
                        Text("Dashboard")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .padding()
                    })
                .navigationBarHidden(true)
                
                Button("Make API Call") {
                    makeAPIRequest()
                }
                .foregroundColor(.blue)
                .background(Color.white)
                .font(.title2)
                .bold()
                .padding()
            }
        }
    }
}
    
    func makeAPIRequest() {
        guard let url = URL(string: "https://api.inopenapp.com/api/v1/dashboardNew") else { return }
        var request = URLRequest(url: url)
        
        // Assuming you have the wild access token stored securely
        let wildAccessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
        
        // Replace with your actual token
        request.setValue("Bearer \(wildAccessToken)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let jsonData = json as? [String: Any] {
                    // Process the JSON data here
                    let response = String(describing: jsonData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
       
let chartData: [ChartDataPoint] = [
        ChartDataPoint(x: "00:00", y: 0),
        ChartDataPoint(x: "01:00", y: 0),
        ChartDataPoint(x: "02:00", y: 0),
        ChartDataPoint(x: "03:00", y: 0),
        ChartDataPoint(x: "04:00", y: 0),
        ChartDataPoint(x: "05:00", y: 0),
        ChartDataPoint(x: "06:00", y: 0),
        ChartDataPoint(x: "07:00", y: 4),
        ChartDataPoint(x: "08:00", y: 7),
        ChartDataPoint(x: "09:00", y: 14),
        ChartDataPoint(x: "10:00", y: 0),
        ChartDataPoint(x: "11:00", y: 0),
        ChartDataPoint(x: "12:00", y: 0),
        ChartDataPoint(x: "13:00", y: 0),
        ChartDataPoint(x: "14:00", y: 0),
        ChartDataPoint(x: "15:00", y: 0),
        ChartDataPoint(x: "16:00", y: 0),
        ChartDataPoint(x: "17:00", y: 0),
        ChartDataPoint(x: "18:00", y: 1),
        ChartDataPoint(x: "19:00", y: 0),
        ChartDataPoint(x: "20:00", y: 0),
        ChartDataPoint(x: "21:00", y: 0),
        ChartDataPoint(x: "22:00", y: 0),
        ChartDataPoint(x: "23:00", y: 0)]

  var body: some View {
    VStack {
      LineChartView(chartData: chartData) // Use the LineChartView
    }
    .padding()
  }

#Preview {
    ContentView()
}
