//
//  OnboardingView.swift
//  DogGram
//
//  Created by Kimleng Hor on 7/18/23.
//

import SwiftUI
import FirebaseAuth

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingPart2: Bool = false
    @State var showError: Bool = false
    
    @State var displayName: String = ""
    @State var email: String = ""
    @State var providerID: String = ""
    @State var provider: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
            
            Text("Welcome to DogGram!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.purpleColor)
            
            Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are a dog-loving community and we're happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpleColor)
                .padding()
            
            Button {
                SignInWithApple.instance.startSignInWithAppleFlow(view: self)
            } label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            }

            Button {
                SignInWithGoogle.instance.startSignInWithGoogleFlow(view: self)
            } label: {
                HStack {
                    Image(systemName: "globe")
                        .font(.body)
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color(red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(5)
                .font(.system(size: 23, weight: .medium, design: .default))
            }
            .tint(Color.white)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            }
            .tint(Color.black)
        }
        .padding(20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .fullScreenCover(isPresented: $showOnboardingPart2) {
            OnboardingViewPart2(displayName: $displayName, email: $email, providerID: $providerID, provider: $provider)
        }
        .alert(isPresented: $showError) {
            return Alert(title: Text("Error signing in 😭"))
        }
    }
    
    //MARK: FUNCTIONS
    func connectToFirebase(name: String, email: String, provider: String, credential: AuthCredential) {
        AuthService.instance.logInUserToFirebase(credential: credential) { providerID, isError in
            if let providerID = providerID, !isError {
                self.displayName = name
                self.email = email
                self.providerID = self.providerID
                self.provider = provider
                self.showOnboardingPart2.toggle()
            } else {
                print("Error getting info from log in user to Firebase")
                self.showError.toggle()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
