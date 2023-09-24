import SwiftUI

struct LoginView: View {
    @Binding var isPatient: Bool
    
    @State private var errorMessage = ""
    @State private var showErrorAlert = false
    
    @State private var username = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var isAuthenticated = false
    
    //disable sign-in button if either username or pass left empty
    var isSignInDisabled: Bool { [username, password].contains(where: \.isEmpty) }

    var body: some View {
        if (isAuthenticated && isPatient) {
            PatientTabView()
                .navigationBarBackButtonHidden(true)
                var loggedIn = true
        } else if (isAuthenticated && !isPatient) {
            ProviderTabView()
                .navigationBarBackButtonHidden(true)
        } else {
            content
        }
    }
    
    var content: some View {
        ZStack {
            Color("OffWhite").ignoresSafeArea()
            VStack(spacing: 15){
                Image("dark-background-finley")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 40)

                //username text field
                HStack {
                    Spacer(minLength: 15)
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(.gray)
                    TextField("Username", text: $username)
                        .padding(.leading, 5)
                    Spacer(minLength: 15)
                }
                .frame(height: 50)
                .background(Color("LightGrey"))
                .cornerRadius(10.0)
                
                //password text field
                HStack {
                    Spacer(minLength: 15)
                    Image(systemName: "lock.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(.gray)
                    Group {
                        if showPassword {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }
                    }
                    .padding(.leading, 5)
                    
                    
                    //toggle password text visibility
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 10)
                }
                .frame(height: 50)
                .background(Color("LightGrey"))
                .cornerRadius(10.0)
                
                //forgot pass
                Button {
                    //reset pass
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(Color("DarkBlue"))
                        
                }
                
                Button {
                    if !isSignInDisabled {
                        // login(username: username, password: password)
                        isAuthenticated = true
                    } else {
                        errorMessage = "Please remember to complete all fields"
                        showErrorAlert = true
                    }
                } label: {
                    Text("Sign In")
                        .frame(width: 250, height: 50)
                        .background(isSignInDisabled ? Color("DarkBlue").opacity(0.6) : Color("DarkBlue"))
                        .cornerRadius(10)
                        .foregroundColor(isSignInDisabled ? .white.opacity(0.4) : .white)
                        .font(Font.system(size: 20))
                        .padding(20)
                }
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Login Failed"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                .offset(y: 30)
            }
            .frame(width: 350)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isPatient: Binding.constant(false))
    }
}

