//
//  LoginView.swift
//  Flow_V2
//
//  Created by CTSS Students on 4/11/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var username = ""
    @State private var opac = 0.0
    @State var hasEnterName = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
    ZStack {
                
        Color.bgColor
                .ignoresSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 340, height: 320)
                    .foregroundColor(.white)
                    .shadow(radius: 4, y: 4)
                
                VStack{
                    if hasEnterName {
                        
                        Text("Nice to meet you,")
                            .font(.system(.title, design: .rounded))
                            .padding()
                        
                        Text(username)
                            .bold()
                            .font(.system(.title, design: .rounded))
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Click here to dismiss")
                                .italic()
                                .underline()
                                .font(.caption)
                                .padding()
                        }
                            
                        
                    }else{
                        
                        Text("Hello, new user!")
                            .font(.system(.title, design: .rounded))
                            .bold()
                        
                        
                        TextField("Enter your name here!", text: $username)
                            .multilineTextAlignment(.center)
                        
                        Button {
                            hasEnterName = true
                            User.username = username
                            opac = 0
                            withAnimation(.easeInOut(duration: 1)) {
                                opac = 1
                            }
                        } label: {
                            
                            Text("Hello! I'm \(username == "" ? "..." : username)")
                                .italic()
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                       
                        }
                        .padding()
                    }
            
                    
                    
                }
                .opacity(opac)
                .onAppear() {
                    withAnimation(.easeIn(duration: 1))
                    {
                        opac = 1
                    }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
