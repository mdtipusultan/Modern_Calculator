////////
////////  SettingsView.swift
////////  Modern Calculator
////////
////////  Created by MacBook Pro M1 Pro on 1/9/25.
////////
////
////import SwiftUI
////
////struct SettingsView: View {
////    @AppStorage("decimalCount") private var decimalCount: Int = 5
////    @AppStorage("thousandsSeparator") private var thousandsSeparator: Bool = true
////    @AppStorage("keepResultOnly") private var keepResultOnly: Bool = true
////    @AppStorage("realTimeResult") private var realTimeResult: Bool = true
////    @AppStorage("saveHistory") private var saveHistory: Bool = true
////    @AppStorage("vibrationEnabled") private var vibrationEnabled: Bool = false
////
////    var body: some View {
////        ZStack {
////            // Background layer - ensure it covers the entire screen
////            Color.black
////                .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
////            
////            
////
////            List {
////                Section(header: Text("PURCHASE").font(.headline).foregroundColor(.white)) {
////                    NavigationLink(destination: Text("CalcKey Pro")) {
////                        HStack {
////                            Image(systemName: "diamond.fill")
////                                .foregroundColor(.blue)
////                            Text("CalcKey Pro")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    NavigationLink(destination: Text("Restore Purchase")) {
////                        HStack {
////                            Image(systemName: "cart")
////                                .foregroundColor(.green)
////                            Text("Restore Purchase")
////                                .foregroundColor(.white)
////                        }
////                    }
////                }
////                .listRowBackground(Color.clear)
////                
////
////                Section(header: Text("CALCULATIONS").font(.headline).foregroundColor(.white)) {
////                    HStack {
////                        Image(systemName: "gearshape")
////                            .foregroundColor(.orange)
////                        Text("Decimals")
////                            .foregroundColor(.white)
////                        Spacer()
////                        HStack {
////                            Button(action: {
////                                if decimalCount > 0 { decimalCount -= 1 }
////                            }) {
////                                Image(systemName: "minus")
////                                    .frame(width: 30, height: 30)
////                                    .background(Color(.systemGray5))
////                                    .cornerRadius(15)
////                            }
////
////                            Text("\(decimalCount)")
////                                .padding(.horizontal)
////                                .foregroundColor(.white)
////
////                            Button(action: {
////                                if decimalCount < 10 { decimalCount += 1 }
////                            }) {
////                                Image(systemName: "plus")
////                                    .frame(width: 30, height: 30)
////                                    .background(Color(.systemGray5))
////                                    .cornerRadius(15)
////                            }
////                        }
////                    }
////
////                    Toggle(isOn: $thousandsSeparator) {
////                        HStack {
////                            Image(systemName: "textformat.123")
////                                .foregroundColor(.purple)
////                            Text("Thousands Separator")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    Toggle(isOn: $keepResultOnly) {
////                        HStack {
////                            Image(systemName: "rectangle.compress.vertical")
////                                .foregroundColor(.teal)
////                            Text("Keep Result Only")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    Toggle(isOn: $realTimeResult) {
////                        HStack {
////                            Image(systemName: "livephoto")
////                                .foregroundColor(.pink)
////                            Text("Real-Time Result")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    Toggle(isOn: $saveHistory) {
////                        HStack {
////                            Image(systemName: "clock.arrow.circlepath")
////                                .foregroundColor(.indigo)
////                            Text("History")
////                                .foregroundColor(.white)
////                        }
////                    }
////                }
////
////                Section(header: Text("SOUND & OTHERS").font(.headline).foregroundColor(.white)) {
////                    NavigationLink(destination: Text("Keyboard Sound")) {
////                        HStack {
////                            Image(systemName: "speaker.wave.3")
////                                .foregroundColor(.yellow)
////                            Text("Keyboard Sound")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    Toggle(isOn: $vibrationEnabled) {
////                        HStack {
////                            Image(systemName: "waveform.path")
////                                .foregroundColor(.red)
////                            Text("Vibration")
////                                .foregroundColor(.white)
////                        }
////                    }
////                }
////
////                Section(header: Text("HISTORY").font(.headline).foregroundColor(.white)) {
////                    HStack {
////                        Image(systemName: "textformat.size")
////                            .foregroundColor(.blue)
////                        Text("History Font Size")
////                            .foregroundColor(.white)
////                        Spacer()
////                        Text("12")
////                            .foregroundColor(.white)
////                    }
////
////                    Toggle(isOn: $saveHistory) {
////                        HStack {
////                            Image(systemName: "folder")
////                                .foregroundColor(.gray)
////                            Text("Save History")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    Button(action: {
////                        // Add confirmation dialog for delete
////                    }) {
////                        HStack {
////                            Image(systemName: "trash")
////                                .foregroundColor(.red)
////                            Text("Delete All History")
////                                .foregroundColor(.white)
////                        }
////                    }
////                    .foregroundColor(.red)
////                }
////
////                Section(header: Text("LEGAL").font(.headline).foregroundColor(.white)) {
////                    NavigationLink(destination: Text("Terms of Use")) {
////                        HStack {
////                            Image(systemName: "doc.text")
////                                .foregroundColor(.gray)
////                            Text("Terms Of Use")
////                                .foregroundColor(.white)
////                        }
////                    }
////
////                    NavigationLink(destination: Text("Privacy Policy")) {
////                        HStack {
////                            Image(systemName: "shield")
////                                .foregroundColor(.blue)
////                            Text("Privacy Policy")
////                                .foregroundColor(.white)
////                        }
////                    }
////                }
////
////                VStack {
////                    Image(systemName: "person.circle.fill")
////                        .resizable()
////                        .frame(width: 80, height: 80)
////                        .foregroundColor(.yellow)
////                    Text("Hello there. It’s just us building this app. If you found our app useful, please give us a good rating. It will help us to grow. Thanks.")
////                        .multilineTextAlignment(.center)
////                        .padding()
////                        .foregroundColor(.white)
////                    HStack {
////                        Button(action: {
////                            // Contact Us action
////                        }) {
////                            Text("Contact Us")
////                                .foregroundColor(.white)
////                                .padding()
////                                .background(Color.orange)
////                                .cornerRadius(10)
////                        }
////
////                        Button(action: {
////                            // Rate App action
////                        }) {
////                            Text("Rate App")
////                                .foregroundColor(.white)
////                                .padding()
////                                .background(Color.green)
////                                .cornerRadius(10)
////                        }
////                    }
////                }
////
////            }
////            
////            .listStyle(.plain)
////            .listRowBackground(Color.gray)
////            .background(Color.clear)
////            .padding()
////        }
////        .navigationTitle("Settings")
////    }
////}
////
////#Preview {
////    SettingsView()
////}
//
//
//import SwiftUI
//
//struct SettingsView: View {
//    @AppStorage("decimalCount") private var decimalCount: Int = 5
//    @AppStorage("thousandsSeparator") private var thousandsSeparator: Bool = true
//    @AppStorage("keepResultOnly") private var keepResultOnly: Bool = true
//    @AppStorage("realTimeResult") private var realTimeResult: Bool = true
//    @AppStorage("saveHistory") private var saveHistory: Bool = true
//    @AppStorage("vibrationEnabled") private var vibrationEnabled: Bool = false
//
//    var body: some View {
//        ZStack {
//            // Background layer - ensure it covers the entire screen
//            Color.black
//                .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
//            
//            List {
//                Section(header: Text("PURCHASE").font(.headline).foregroundColor(.white)) {
//                    NavigationLink(destination: Text("CalcKey Pro")) {
//                        HStack {
//                            Image(systemName: "diamond.fill")
//                                .foregroundColor(.blue)
//                            Text("CalcKey Pro")
//                                .foregroundColor(.white)
//                        }
//                    }
//                
//                    NavigationLink(destination: Text("Restore Purchase")) {
//                        HStack {
//                            Image(systemName: "cart")
//                                .foregroundColor(.green)
//                            Text("Restore Purchase")
//                                .foregroundColor(.white)
//                        }
//                    }
//                }
//                .listRowBackground(Color.clear)
//                
//                Section(header: Text("CALCULATIONS").font(.headline).foregroundColor(.white)) {
//                    HStack {
//                        Image(systemName: "gearshape")
//                            .foregroundColor(.orange)
//                        Text("Decimals")
//                            .foregroundColor(.white)
//                        Spacer()
//                        HStack {
//                            Button(action: {
//                                if decimalCount > 0 { decimalCount -= 1 }
//                            }) {
//                                Image(systemName: "minus")
//                                    .frame(width: 30, height: 30)
//                                    .background(Color(.systemGray5))
//                                    .cornerRadius(15)
//                                    .foregroundColor(.red) // Red color for the minus button
//                            }
//
//                            Text("\(decimalCount)")
//                                .padding(.horizontal)
//                                .foregroundColor(.white)
//
//                            Button(action: {
//                                if decimalCount < 10 { decimalCount += 1 }
//                            }) {
//                                Image(systemName: "plus")
//                                    .frame(width: 30, height: 30)
//                                    .background(Color(.systemGray5))
//                                    .cornerRadius(15)
//                                    .foregroundColor(.red) // Red color for the plus button
//                            }
//                        }
//                    }
//
//                    Toggle(isOn: $thousandsSeparator) {
//                        HStack {
//                            Image(systemName: "textformat.123")
//                                .foregroundColor(.purple)
//                            Text("Thousands Separator")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                    Toggle(isOn: $keepResultOnly) {
//                        HStack {
//                            Image(systemName: "rectangle.compress.vertical")
//                                .foregroundColor(.teal)
//                            Text("Keep Result Only")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                    Toggle(isOn: $realTimeResult) {
//                        HStack {
//                            Image(systemName: "livephoto")
//                                .foregroundColor(.pink)
//                            Text("Real-Time Result")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                    Toggle(isOn: $saveHistory) {
//                        HStack {
//                            Image(systemName: "clock.arrow.circlepath")
//                                .foregroundColor(.indigo)
//                            Text("History")
//                                .foregroundColor(.white)
//                        }
//                    }
//                }
//                .listRowBackground(Color.clear)
//
//                Section(header: Text("SOUND & OTHERS").font(.headline).foregroundColor(.white)) {
//                    NavigationLink(destination: Text("Keyboard Sound")) {
//                        HStack {
//                            Image(systemName: "speaker.wave.3")
//                                .foregroundColor(.yellow)
//                            Text("Keyboard Sound")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                    Toggle(isOn: $vibrationEnabled) {
//                        HStack {
//                            Image(systemName: "waveform.path")
//                                .foregroundColor(.red)
//                            Text("Vibration")
//                                .foregroundColor(.white)
//                        }
//                    }
//                    
//                }
//                .listRowBackground(Color.clear)
//
//                Section(header: Text("HISTORY").font(.headline).foregroundColor(.white)) {
//                    HStack {
//                        Image(systemName: "textformat.size")
//                            .foregroundColor(.blue)
//                        Text("History Font Size")
//                            .foregroundColor(.white)
//                        Spacer()
//                        Text("12")
//                            .foregroundColor(.white)
//                    }
//
//                    Toggle(isOn: $saveHistory) {
//                        HStack {
//                            Image(systemName: "folder")
//                                .foregroundColor(.gray)
//                            Text("Save History")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                    Button(action: {
//                        // Add confirmation dialog for delete
//                    }) {
//                        HStack {
//                            Image(systemName: "trash")
//                                .foregroundColor(.red)
//                            Text("Delete All History")
//                                .foregroundColor(.white)
//                        }
//                    }
//                    .foregroundColor(.red)
//                }
//                .listRowBackground(Color.clear)
//
//                Section(header: Text("LEGAL").font(.headline).foregroundColor(.white)) {
//                    NavigationLink(destination: Text("Terms of Use")) {
//                        HStack {
//                            Image(systemName: "doc.text")
//                                .foregroundColor(.gray)
//                            Text("Terms Of Use")
//                                .foregroundColor(.white)
//                        }
//                    }
//
//                    NavigationLink(destination: Text("Privacy Policy")) {
//                        HStack {
//                            Image(systemName: "shield")
//                                .foregroundColor(.blue)
//                            Text("Privacy Policy")
//                                .foregroundColor(.white)
//                        }
//                    }
//                }
//                .listRowBackground(Color.clear)
//
//                VStack {
//                    Image(systemName: "person.circle.fill")
//                        .resizable()
//                        .frame(width: 80, height: 80)
//                        .foregroundColor(.yellow)
//                    Text("Hello there. It’s just us building this app. If you found our app useful, please give us a good rating. It will help us to grow. Thanks.")
//                        .multilineTextAlignment(.center)
//                        .padding()
//                        .foregroundColor(.white)
//                    HStack {
//                        Button(action: {
//                            // Contact Us action
//                        }) {
//                            Text("Contact Us")
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.orange)
//                                .cornerRadius(10)
//                        }
//
//                        Button(action: {
//                            // Rate App action
//                        }) {
//                            Text("Rate App")
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(Color.green)
//                                .cornerRadius(10)
//                        }
//                    }
//                }
//                .padding()
//                .background(Color.gray)
//                .cornerRadius(20)
//                .listRowBackground(Color.clear)
//
//            }
//            .listStyle(.plain)
//            .background(Color.clear)
//            .padding()
//        }
//        .accentColor(Color.red)
//        .navigationTitle("Settings")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//#Preview {
//    SettingsView()
//}


import SwiftUI

struct SettingsView: View {
    @AppStorage("decimalCount") private var decimalCount: Int = 5
    @AppStorage("thousandsSeparator") private var thousandsSeparator: Bool = true
    @AppStorage("keepResultOnly") private var keepResultOnly: Bool = true
    @AppStorage("realTimeResult") private var realTimeResult: Bool = true
    @AppStorage("saveHistory") private var saveHistory: Bool = true
    @AppStorage("vibrationEnabled") private var vibrationEnabled: Bool = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all) // Ensure it covers the entire screen
            
            List {
                Section(header: Text("PURCHASE").font(.headline).foregroundColor(.white)) {
                    NavigationLink(destination: Text("CalcKey Pro")) {
                        HStack {
                            Image(systemName: "diamond.fill")
                                .foregroundColor(.blue)
                            Text("CalcKey Pro")
                                .foregroundColor(.white)
                        }
                    }
                
                    NavigationLink(destination: Text("Restore Purchase")) {
                        HStack {
                            Image(systemName: "cart")
                                .foregroundColor(.green)
                            Text("Restore Purchase")
                                .foregroundColor(.white)
                        }
                    }
                }
                .listRowBackground(Color.clear)
                
                Section(header: Text("CALCULATIONS").font(.headline).foregroundColor(.white)) {
                    HStack {
                        Image(systemName: "gearshape")
                            .foregroundColor(.orange)
                        Text("Decimals")
                            .foregroundColor(.white)
                        Spacer()
                        HStack {
                            Button(action: {
                                if decimalCount > 0 { decimalCount -= 1 }
                            }) {
                                Image(systemName: "minus")
                                    .frame(width: 30, height: 30)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                            }

                            Text("\(decimalCount)")
                                .padding(.horizontal)
                                .foregroundColor(.white)

                            Button(action: {
                                if decimalCount < 10 { decimalCount += 1 }
                            }) {
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .background(Color(.systemGray5))
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                            }
                        }
                    }

                    Toggle(isOn: $thousandsSeparator) {
                        HStack {
                            Image(systemName: "textformat.123")
                                .foregroundColor(.purple)
                            Text("Thousands Separator")
                                .foregroundColor(.white)
                        }
                    }
                    .accentColor(.red)  // Set accent color for Toggle

                    Toggle(isOn: $keepResultOnly) {
                        HStack {
                            Image(systemName: "rectangle.compress.vertical")
                                .foregroundColor(.teal)
                            Text("Keep Result Only")
                                .foregroundColor(.white)
                        }
                    }
                    .accentColor(.red)  // Set accent color for Toggle

                    Toggle(isOn: $realTimeResult) {
                        HStack {
                            Image(systemName: "livephoto")
                                .foregroundColor(.pink)
                            Text("Real-Time Result")
                                .foregroundColor(.white)
                        }
                    }
                    .accentColor(.red)  // Set accent color for Toggle

                    Toggle(isOn: $saveHistory) {
                        HStack {
                            Image(systemName: "clock.arrow.circlepath")
                                .foregroundColor(.indigo)
                            Text("History")
                                .foregroundColor(.white)
                        }
                    }
                    .accentColor(.red)  // Set accent color for Toggle
                }
                .listRowBackground(Color.clear)

                Section(header: Text("SOUND & OTHERS").font(.headline).foregroundColor(.white)) {
                    NavigationLink(destination: Text("Keyboard Sound")) {
                        HStack {
                            Image(systemName: "speaker.wave.3")
                                .foregroundColor(.yellow)
                            Text("Keyboard Sound")
                                .foregroundColor(.white)
                        }
                    }

                    Toggle(isOn: $vibrationEnabled) {
                        HStack {
                            Image(systemName: "waveform.path")
                                .foregroundColor(.red)
                            Text("Vibration")
                                .foregroundColor(.white)
                        }
                    }
                    .accentColor(.red)  // Set accent color for Toggle
                }
                .listRowBackground(Color.clear)

                Section(header: Text("HISTORY").font(.headline).foregroundColor(.white)) {
                    HStack {
                        Image(systemName: "textformat.size")
                            .foregroundColor(.blue)
                        Text("History Font Size")
                            .foregroundColor(.white)
                        Spacer()
                        Text("12")
                            .foregroundColor(.white)
                    }

                    Toggle(isOn: $saveHistory) {
                        HStack {
                            Image(systemName: "folder")
                                .foregroundColor(.gray)
                            Text("Save History")
                                .foregroundColor(.white)
                        }
                    }
                    .accentColor(.red)  // Set accent color for Toggle

                    Button(action: {
                        // Add confirmation dialog for delete
                    }) {
                        HStack {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                            Text("Delete All History")
                                .foregroundColor(.white)
                        }
                    }
                    .foregroundColor(.red)
                }
                .listRowBackground(Color.clear)

                Section(header: Text("LEGAL").font(.headline).foregroundColor(.white)) {
                    NavigationLink(destination: Text("Terms of Use")) {
                        HStack {
                            Image(systemName: "doc.text")
                                .foregroundColor(.gray)
                            Text("Terms Of Use")
                                .foregroundColor(.white)
                        }
                    }

                    NavigationLink(destination: Text("Privacy Policy")) {
                        HStack {
                            Image(systemName: "shield")
                                .foregroundColor(.blue)
                            Text("Privacy Policy")
                                .foregroundColor(.white)
                        }
                    }
                }
                .listRowBackground(Color.clear)

                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.yellow)
                    Text("Hello there. It’s just us building this app. If you found our app useful, please give us a good rating. It will help us to grow. Thanks.")
                        .multilineTextAlignment(.center)
                        .padding()
                        .foregroundColor(.white)
                    HStack {
                        Button(action: {
                            // Contact Us action
                        }) {
                            Text("Contact Us")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.orange)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            // Rate App action
                        }) {
                            Text("Rate App")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
                .background(Color.gray)
                .cornerRadius(20)
                .listRowBackground(Color.clear)

            }
            .listStyle(.plain)
            .background(Color.clear)
            .padding()
        }
        .accentColor(.green)  // Apply global accent color
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    SettingsView()
}
