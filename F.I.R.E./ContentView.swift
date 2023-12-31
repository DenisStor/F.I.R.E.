import SwiftUI

struct ContentView: View {
    @AppStorage ("currentPage") var currentPage : Int = 1
    
   

    var body: some View {
        ZStack{
        
            Start_Screen()
                .offset(x: currentPage == 1 ? 0 :  -700)
        
            Bar_Screen()
                .offset(x: currentPage == 2 ? 0 :  700)
        
        
        }.animation(.easeInOut, value: currentPage )
            
   }
}
 // true, true, true , false ,false , true
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone SE (3rd generation)")
        ContentView()
            .previewDevice("iPhone 14 Pro")
    }
}

