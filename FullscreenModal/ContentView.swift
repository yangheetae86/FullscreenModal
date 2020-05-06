// View { ZStack { NavigationView { VStack { Button { withAnimation { self.isPresented.toggle()
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Button(action: {
                        withAnimation{
                        self.isPresented.toggle()//값을 true로 바꾼다 self.isPresented=true
                        }
                    }, label: {
                        Text("Show standard modal")
                    })
                }
                .navigationBarTitle("Standard")
            }
            ZStack {
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Button(action: {
                                //trigger modal presentation
                                withAnimation{
                                self.isPresented.toggle()//값을 true로 바꾼다 self.isPresented=true
                                }
                            }, label: {
                                Text("Dismiss")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            })
                            Spacer()
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    withAnimation {
                                        self.isPresented.toggle()
                                    }
                                }
                        }
                            .padding(.top,
                                     UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .background(Color.yellow)
            .edgesIgnoringSafeArea(.all)
            .offset(x: 0, y: self.isPresented ? 0 :
                UIApplication.shared.keyWindow?.frame.height ?? 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//binding이란 무엇인가를 푼다는의미로 해석, '$'를 앞에두고 @State Bool타입 변수를 넣는다(여기서만?)
//isPresented 표시됩니다, content 표시되는 내용들
