import SwiftUI

struct AuthView: View {
    
    @State private var isLoginState: Bool = false
    @State private var isSignupState: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                createImg(size: geo.size)
                createContextContainer(size: geo.size)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

private extension AuthView {
    
    func createImg(size: CGSize) -> some View {
        ZStack(alignment: .top) {
            Image(!isLoginState && !isSignupState ? "welcome" : isLoginState ? "login" : "signUp")
                .resizable()
            LinearGradient(
                colors: [
                    Color(hex: "000000"),
                    Color(hex: "000000").opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: size.height * 0.13)
            Text("Welcome")
                .font(Font.Poppins.Medium18)
                .foregroundStyle(Color.white)
                .offset(y: size.height * 0.08)
        }
    }
    
    func createContextContainer(size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    Color(hex: "F4F5F9")
                )
                .frame(
                    width: size.width,
                    height: size.height * (!isLoginState && !isSignupState ? 0.399 : isLoginState ? 0.505 : 0.52)
                )
            createContext(size: size)
        }
        .frame(width: size.width, height: size.height, alignment: .bottom)
    }
    
    func createContext(size: CGSize) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(!isLoginState && !isSignupState ? "Welcome" : isLoginState ? "Welcome Back!" : "Create account")
                .font(Font.Poppins.semiBold25)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color(hex: "000000"))
            Text(!isLoginState && !isSignupState ? "Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy" : isLoginState ? "Sign in to your account" : "Quickly create account")
                .font(Font.Poppins.Medium15)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Color(hex: "868889"))
            if !isLoginState && !isSignupState {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                    HStack {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(height: size.height * 0.03)
                        Spacer()
                        Text("Continue with google")
                            .font(Font.Poppins.Medium15)
                            .foregroundStyle(Color(hex: "000000"))
                        Spacer()
                        
                    }
                    .padding(.horizontal, 33)
                }
                .frame(height: size.height * 0.075)
                .padding(.top, 27)
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(hex: "AEDC81"),
                                    Color(hex: "6CC51D"),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color.white)
                            .frame(height: size.height * 0.03)
                        Spacer()
                        Text("Create an account")
                            .font(Font.Poppins.Medium15)
                            .foregroundStyle(Color(hex: "FFFFFF"))
                        Spacer()
                        
                    }
                    .padding(.horizontal, 33)
                }
                .frame(height: size.height * 0.075)
                .padding(.bottom, 20)
                .padding(.top, 12)
                .onTapGesture {
                    isSignupState = true
                    isLoginState = false
                }
            }
            
            if isLoginState || isSignupState {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            Color.white
                        )
                }
                .frame(height: size.height * 0.075)
                .padding(.bottom, 5)
                .padding(.top, 26)
                if isSignupState {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(
                                Color.white
                            )
                    }
                    .frame(height: size.height * 0.075)
                    .padding(.bottom, 5)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            Color.white
                        )
                }
                .frame(height: size.height * 0.075)
                .padding(.bottom, isLoginState ? 21 : 17)
            }
            
            if isLoginState {
                HStack {
                    Spacer()
                    Text("Forgot password")
                        .font(Font.Poppins.Medium15)
                        .foregroundStyle(Color(hex: "407EC7"))
                }
                .padding(.bottom, 17)
            }
            
            
            if isLoginState || isSignupState {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(hex: "AEDC81"),
                                    Color(hex: "6CC51D"),
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    Text(isLoginState ? "Login" : "Signup")
                        .font(Font.Poppins.Medium15)
                        .foregroundStyle(Color(hex: "FFFFFF"))
                }
                .frame(height: size.height * 0.075)
                .padding(.bottom, 20)
            }
            
            HStack {
                Text(!isLoginState ? "Already have an account ?" : "Don’t have an account ?")
                    .font(Font.Poppins.Regular15)
                    .foregroundStyle(Color(hex: "868889"))
                Text(!isLoginState ? "Login" : "Sign up")
                    .font(Font.Poppins.Medium15)
                    .foregroundStyle(Color(hex: "000000"))
                    .onTapGesture {
                        if !isLoginState && !isSignupState {
                            isLoginState = true
                            isSignupState = false
                        } else if isLoginState {
                            isSignupState = true
                            isLoginState = false
                        } else if isSignupState {
                            isLoginState = true
                            isSignupState = false
                        }
                    }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.horizontal, 16)
        .padding(.top, (!isLoginState && !isSignupState ? 31 : isLoginState ? 30 : 29))
        .padding(.bottom, (!isLoginState && !isSignupState ? 39 : isLoginState ? 34 : 22))
    }
}

#Preview {
    AuthView()
}
