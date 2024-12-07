//
//  ContentView.swift
//  Notifications
//
//  Created by user272495 on 12/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request permission"){
                requestPermission()
            }
            Button("Schedule notification"){
                scheduleNotification()
            }
            Button("Calendar notification"){
                calendarNotification()
            }
        }
        .padding()
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Permission granted: \(granted)")
            }
            
            
        }
    }
    
    func calendarNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Local notification"
        content.body = "A schedule notification"
        content.sound = .default
        
        
        var dateComponents = DateComponents()
        dateComponents.hour = 22
        dateComponents.minute = 3
        dateComponents.second = 0
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification ok")
            }
        }
        
    }
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Local notification"
        content.body = "A schedule notification"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else {
                print("Schedule notification ok")
            }
        }
    }
}

#Preview {
    ContentView()
}
