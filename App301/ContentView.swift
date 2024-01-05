//
//  ContentView.swift
//  App301
//
//  Created by Вячеслав on 12/24/23.
//

import SwiftUI
import Amplitude

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Home
    
    @State var server: String = ""
    @State var telegram: URL = URL(string: "h")!
    @State var isTelegram: Bool = false
    @State var isDead: Bool = false
    
    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            if server.isEmpty || telegram.absoluteString == "h" {
                
                LoadingView()
                
            } else {
                
                if server == "0" {
                    
                    if status {
                        
                        WebSystem()
                        
                    } else {
                        
                        Users_1(telegram: telegram, isTelegram: isTelegram)
                    }
                    
                } else if server == "1" {
                    
                    if status {
                        
                        VStack(spacing: 0, content: {
                            
                            TabView(selection: $current_tab, content: {
                                
                                StatisticsView()
                                    .tag(Tab.Statistics)
                                
                                MissionsView()
                                    .tag(Tab.Missions)
                                
                                HomeView()
                                    .tag(Tab.Home)
                                
                                PropertyView()
                                    .tag(Tab.Property)
                                
                                SettingsView()
                                    .tag(Tab.Settings)

                            })
                            
                            TabBar(selectedTab: $current_tab)
                        })
                        .ignoresSafeArea(.all, edges: .bottom)
                        .onAppear {
                            
                            DataManager().sendLog(event: .ZaglushkaIsShowed)
                            Amplitude.instance().logEvent("did_show_main_screen")
                        }
                        
                    } else {
                        
                        Reviewers_1()
                    }
                }
            }
        }
        .onAppear {
            
            check_data(isCaptured: false)
        }
    }
    
    @MainActor private func check_data(isCaptured: Bool) {
        
        DataManager().sendLog(event: .appStart)
        
        getFirebaseData(field: "telegram", dataType: .url) { telegramResult in
            
            let telegramResult = telegramResult as? URL ?? URL(string: "https://google.com")!
            telegram = telegramResult
            
            getFirebaseData(field: "isTelegram", dataType: .bool) { isTelegramResult in
                
                let isTelegramResult = isTelegramResult as? Bool ?? false
                isTelegram = isTelegramResult
                
                getFirebaseData(field: "isDead", dataType: .bool) { result1 in
                    
                    let result1 = result1 as? Bool ?? false
                    isDead = result1
                    
                    getFirebaseData(field: "lastDate", dataType: .string) { lastDate in
                        
                        let lastDate = lastDate as? String ?? "01.01.2030"
                        let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "dd.MM.yyyy"
                        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
                        let targetDate = dateFormatter.date(from: lastDate) ?? Date()
                        
                        let repository = RepositorySecond()
                        let myData = MyDataClass.getMyData()
                        let now = Date()

                        guard now > targetDate else {
                            
                            DataManager().sendLog(event: .withoutRequest)

                            server = "1"

                            return
                        }
                        
                        DataManager().sendLog(event: .isDone1_0)
                        
                        repository.post(isCaptured: isCaptured, isCast: false, mydata: myData) { result in
                            
                            switch result {
                            case .success(let data):
                                
                                DataManager().sendLog(event: .valueOf_1_0, eventValue: "\(data)")
                                
                                if "\(data)" == "" {
                                    
                                    self.server = "1"
                                    
                                } else {
                                    
                                    self.server = "\(data)"
                                }
                                
                            case .failure(_):
                                
                                if self.isDead == true {
                                    
                                    self.server = "0"
                                    
                                } else {
                                    
                                    self.server = "1"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
