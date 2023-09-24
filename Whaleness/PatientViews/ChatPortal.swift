//
//  WorkOrders.swift
//  Pro-G
//
//  Created by Luana Liao on 6/20/23.
//

import SwiftUI

struct ChatPortal: View {
    @State private var selectedTab = 0
    @State private var userInput = ""
    @State private var messageText = ""
    @State private var chatMessages: [Message] = []

    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                // Chat messages display
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
                        Text("When is my next appointment?\nWhat are the side effects of the medication I'm taking?")
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

struct ChatPortal_Previews: PreviewProvider {
    static var previews: some View {
        ChatPortal()
    }
}

struct Message: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isUser {
                Spacer()
                Text(message.text)
                    .padding(8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } else {
                Text(message.text)
                    .padding(8)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}
