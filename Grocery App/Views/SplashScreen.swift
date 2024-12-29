import SwiftUI

struct SplashScreen: View {
    
    @State private var currentPage: Int = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                TabView(selection: $currentPage) {
                    ForEach(0...3, id: \.self) { page in
                        ZStack {
                            Color(hex: "C4C4C4")
                            Image("splash\(page + 1)")
                                .resizable()
                                .scaledToFill()
                                createTitleOfPage(page, size: geo.size)
                                    .multilineTextAlignment(.center)
                                    .font(Font.Poppins.titleBold)
                                    .offset(y: -geo.size.height * (page != 0 ? 0.35 : 0.37))
                                if page == 0 {
                                    Image("bigCartTitle")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geo.size.width * 0.4)
                                        .offset(y: -geo.size.height * 0.315)
                                }
                            createSubTitleOfPage(page, size: geo.size)
                                .multilineTextAlignment(.center)
                                .font(Font.Poppins.Medium15)
                                .offset(y: -geo.size.height * 0.25)
                                .foregroundStyle(Color(hex: "868889"))
                        }
                        .tag(page)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .offset(y: -geo.size.height * 0.015)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                createDisplayingPageContainer(size: geo.size)
                createGetStartButton(size: geo.size)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

private extension SplashScreen {
    
    func createTitleOfPage(_ page: Int, size: CGSize) -> Text {
        switch page {
        case 0:
            return Text("Welcome to")
        case 1:
            return Text("Buy Quality\nDairy Products")
        case 2:
            return Text("Buy Premium\nQuality Fruits")
        default:
            return Text("Get Discounts\nOn All Products")
        }
    }
    
    func createSubTitleOfPage(_ page: Int, size: CGSize) -> Text {
        switch page {
        case 0:
            return Text("Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy")
        case 1:
            return Text("Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy")
        case 2:
            return Text("Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy")
        default:
            return Text("Lorem ipsum dolor sit amet, consetetur\nsadipscing elitr, sed diam nonumy")
        }
    }
    
    func createDisplayingPageContainer(size: CGSize) -> some View {
        HStack(spacing: 8) {
            ForEach(0...3, id: \.self) { page in
                Circle()
                    .fill(page == currentPage ? Color(hex: "6CC51D") : Color(hex: "DCDCDC"))
                    .frame(width: size.width * 0.02, height: size.width * 0.02)
            }
        }
        .offset(y: size.height * 0.3)
    }
    
    func createGetStartButton(size: CGSize) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: size.width * 0.01)
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
                .shadow(color: Color(hex: "6CC51D").opacity(0.25), radius: 5, x: 0, y: 10)
            Text("get started".uppercased())
                .font(Font.Poppins.semiBold15)
                .foregroundStyle(.white)
        }
        .frame(width: size.width * 0.96, height: size.height * 0.075)
        .offset(y: size.height * 0.38)
    }
}

#Preview {
    SplashScreen()
}
