//
//  DashboardView.swift
//  APICallTest
//
//  Created by Meghna Vyas on 24/04/24.
//

import SwiftUI

struct DashboardView: View {
    @State private var response: String = "" // for API response

    var body: some View {
        VStack {
            Text(response)
                .padding()
            Button("Make API Call") {
                makeAPIRequest()
            }
            .foregroundColor(.blue)
            .font(.title3)
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
                    self.response = String(describing: jsonData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
#Preview {
    DashboardView()
}
