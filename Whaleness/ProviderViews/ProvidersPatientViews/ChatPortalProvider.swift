//
//  ChatPortalProvider.swift
//  Whaleness
//
//  Created by Jennifer Chiu on 9/24/23.
//

import SwiftUI

struct ChatPortalProvider: View {
    @State private var selectedTab = 0
    @State private var userInput = ""
    @State private var messageText = ""
    @State private var chatMessages: [Message] = []

    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                HStack{
                    Text("Chatbot")
                        .font(Font.custom("Avenir-Medium", size: 25))
                        .foregroundStyle(Color("DarkBlue"))
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                    Spacer()
                }
                
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Questions you could ask...")
                            .font(Font.custom("Avenir", size: 20))
                            .padding(.horizontal, 30)
                        Spacer()
                        Text("How are you feeling?\nHave you had any side effects??")
                            .font(Font.custom("Avenir", size: 15))
                            .padding(.horizontal, 30)
                        Spacer()
                    }
                    VStack(spacing: 10) {
                        ForEach(chatMessages, id: \.self) { message in
                            MessageView(message: message)
                        }
                    }
                }
                .padding()
                Spacer()
                // User input
                HStack {
                    TextField("Type a message...", text: $userInput, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(5)
                        .padding()
                        .font(Font.custom("Avenir-Medium", size: 20))
                        //.background(.white)
                        //.cornerRadius(10)
                        .onSubmit {
                            sendMessage()
                        }
                    Button {
                        sendMessage()
                    } label: {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                    }
                    .padding(.horizontal, 20)
                    .foregroundColor(Color("DarkGrey"))
                }
            }
            .background(Color(.systemGray6))
            .background(Color("OffWhite"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color("DarkBlue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
    func sendMessage() {
        let userMessage = Message(text: userInput, isUser: true)
        chatMessages.append(userMessage)
        
        userInput = ""
    }
}

struct ChatPortalProvider_Previews: PreviewProvider {
    static var previews: some View {
        ChatPortalProvider()
    }
}
