//
//  d.swift
//  App301
//
//  Created by Вячеслав on 1/5/24.
//

import SwiftUI
import ApphudSDK

struct DataManager {
    
    let appHudID: String = "app_WZ9Nh2fFq5XVyYM7DFZFzsgyT5PebR"
    let oneSignalID: String = "f5065ba2-b3d5-4194-b71a-79fdef759334"
    let amplitudeID: String = "875dbed4423dcdbb04a3529a069752a9"
    
    let server1_0: String = "popweert.space/app/gr0wb00st"
    let usagePolicy: String = "https://docs.google.com/document/d/1eQ7U0f2xasUKHYzEfZJ21IIW04c4S0FSWtZ6n4fkSRo/edit?usp=sharing"
    
    let appCode: String = "gr0wb00st"
    let domain: String = "popweert.space"
    
    @MainActor func sendLog(event: EventIDs, eventValue: String? = nil) {
        
        guard let url = URL(string: "https://\(domain)/api/v2/appLog") else {
            
            print("Invalid URL")
            
            return
        }

        // Создание JSON тела запроса
        let requestBody: [String: Any] = [
            
            "appCode": appCode,
            "eventId": event.id,
            "eventValue": eventValue ?? "",
            "userId": Apphud.userID(),
            "country": Locale.current.regionCode ?? "nil"
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Error: Cannot create JSON from requestBody")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                print("Client error: \(error.localizedDescription)")
                
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                
                print("Server error: \(String(describing: response))")
                
                return
            }

            if let data = data,
               let responseString = String(data: data, encoding: .utf8) {
                
                print("Response String: \(responseString)")
            }
        }

        task.resume()
    }
}

enum EventIDs: CaseIterable {
    
    case appStart, isDone1_0, valueOf_1_0, isGotPartnerLink
    case isGotThreadLink, startLoadingWVLink, isLoadedPartnerLink, isLoadedThreadLink, WVLinkError
    case threadLinkWasSaved, userStartedAppRetry, WVisShowed, ZaglushkaIsShowed, withoutRequest
    
    var id: Int {
        
        switch self {
            
        case .appStart:
            return 1
        case .isDone1_0:
            return 2
        case .valueOf_1_0:
            return 3
        case .isGotPartnerLink:
            return 4
        case .isGotThreadLink:
            return 5
        case .startLoadingWVLink:
            return 6
        case .isLoadedPartnerLink:
            return 7
        case .isLoadedThreadLink:
            return 8
        case .WVLinkError:
            return 9
        case .threadLinkWasSaved:
            return 10
        case .userStartedAppRetry:
            return 11
        case .WVisShowed:
            return 12
        case .ZaglushkaIsShowed:
            return 13
        case .withoutRequest:
            return 14
        }
    }
}
