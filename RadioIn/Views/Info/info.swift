//
//  info.swift
//  RadioIn
//
//  Created by Ion Ceban on 7/8/21.
//

import SwiftUI

struct info: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 50) {
                
                Text(" I am an iOS Developer,\n and  RadioIn it’s my first application on AppStore. Thank everyone for \n downloading  and your support.\n Appreciate any review. Please check\n my profiles, and I will \n appreciate a lot for following.")
                    .font(.title3)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(2)
                
                HStack (alignment: .center, spacing: 25){
                    Button(action: openFacebook) {
                        Image("Facebook")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    
                    Button(action: openInsta) {
                        Image("Insta")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    
                    Button(action: openGithub) {
                        Image("GitHub")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                    
                    Button(action: openLinkdin) {
                        Image("LinkdIn")
                            .resizable()
                            .frame(width: 40, height: 40, alignment: .center)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("  Developer")
        }
    }
    
    //MARK: - Extensions (buttons methods)
    
    func openFacebook() {
           guard let url = URL(string: "https://www.facebook.com/ion.ceban.5201") else {
               return
           }
           openURL(url)
       }
    
    func openInsta() {
           guard let url = URL(string: "https://www.instagram.com/ceban_coding/") else {
               return
           }
           openURL(url)
       }
    
    func openGithub() {
           guard let url = URL(string: "https://github.com/ceban-coding") else {
               return
           }
           openURL(url)
       }
    
    func openLinkdin() {
           guard let url = URL(string: "https://www.linkedin.com/in/ion-ceban/") else {
               return
           }
           openURL(url)
       }
}


struct info_Previews: PreviewProvider {
    static var previews: some View {
        info()
    }
}
