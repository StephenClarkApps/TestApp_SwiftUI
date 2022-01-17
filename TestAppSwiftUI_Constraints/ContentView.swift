//
//  ContentView.swift
//  TestAppSwiftUI_Constraints
//
//  Created by Stephen Clark on 16/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    // View model (perhaps injected)
    /*
     You should use @StateObject only once per object, which should be in whichever view is responsible for creating the object. All other views that share your object should use @ObservedObject.
     */
    @StateObject var model: UserOrderViewModel = UserOrderViewModel()
    
    // MARK:  BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section("Your Details") {
                        TextField("Enter your name", text: $model.firstName)
                        TextField("Enter your name", text: $model.lastName)
                        DatePicker("Date of Birth", selection: $model.dateOfBirth, displayedComponents: .date)
                        TextField("Email address", text: $model.emailAddress)
                    }
                    Section("Your Address") {
                        TextField("Address Line One", text: $model.addressLineOne)
                        TextField("Address Line Two", text: $model.addressLineTwo)
                        TextField("Town/City", text: $model.townOrCity)
                        TextField("Postcode", text: $model.postcode)
                    }
                } //: FORM
                Spacer()
            } //: VSTACK
            .navigationTitle("Your Order")
            .navigationBarItems(trailing:
                                    
                Button("Submit") {
                    print("User tapped submit")
            }.font(.system(size: 14)).disabled(!$model.complete.wrappedValue)
                                
            )
            .background(.thickMaterial)
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 
 The following warning is likely to still show in the logs, this has been described by Quinn the eskimo as "log noise", needless to say it's something that apple sould resolve properly.
 
 
 objc[3859]: Class _PathPoint is implemented in both /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/UIKitCore.framework/UIKitCore (0x1291c5e30) and /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/System/Library/PrivateFrameworks/TextInputUI.framework/TextInputUI (0x12efd68b8). One of the two will be used. Which one is undefined.
 */
