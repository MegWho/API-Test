//
//  Chart.swift
//  APICallTest
//
//  Created by Meghna Vyas on 24/04/24.
//
import SwiftUI
import Charts

struct ChartDataPoint: Identifiable {
  let id = UUID()
  let x: String // X-axis label (time in HH:mm format)
  let y: Int // Y-axis value (integer)
}

struct LineChartView: View {
  let chartData: [ChartDataPoint]

  var body: some View {
    VStack {
      Chart(chartData) { point in
        LineMark(
          x: .value("Time", point.x),
          y: .value("Clicks", point.y)
        )
      }
      .frame(width: 300, height: 200)
      .accentColor(.blue)
    }
  }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView(chartData: [
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
            ChartDataPoint(x: "23:00", y: 0)
        ])
    }
}
