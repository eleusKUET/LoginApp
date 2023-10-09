import SwiftUI

struct ContentView: View {
    var body: some View {
        Home().preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State var index = 0
    
    var body: some View {
        GeometryReader {_ in
            ScrollView {
                VStack {
                    // Login View
                    Login(index: $index)
                    
                    // Divider
                }
                .padding(.vertical)
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

// Login
struct Login: View {
    @State var email = ""
    @State var password = ""
    @Binding var index: Int
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 10) {
                    Text("Login")
                        .foregroundColor(self.index == 0 ? .white : .gray)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Capsule()
                        .fill(self.index == 0 ? Color.blue : Color.clear)
                        .frame(width: 100, height: 5)
                }
                
                Spacer(minLength: 0)
            }
            .padding(.top, 30)
            
            // Email Field
            VStack {
                HStack {
                    Image(systemName: "envelope.fill")
                        .foregroundColor(Color("Color1"))
                    
                    TextField("Email Address", text: self.$email)
                }
                
                Divider().background(Color.white.opacity(0.5))
            }
            .padding(.horizontal)
            .padding(.top, 40)
            
            // Password Field
            VStack {
                HStack {
                    Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("Color1"))
                    
                    SecureField("Password", text: self.$password)
                }
                
                Divider().background(Color.white.opacity(0.5))
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            // Forget Password
            HStack {
                Spacer(minLength: 0)
                Button(action: {
                    // Handle forgot password action
                }) {
                    Text("Forgot Password?")
                        .foregroundColor(Color.white.opacity(0.6))
                }
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
            // Login Button
            Button(action: {
                // Handle login action
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
        .padding()
    }
}
