//
//  Famous_Screen.swift
//  F.I.R.E.
//
//  Created by Денис Сторожев on 23.05.2023.
//

import SwiftUI

struct Famous_Screen: View {
    @State private var name : [String] = [
    NSLocalizedString("word_0", comment: ""),
    NSLocalizedString("word_1", comment: ""),
    NSLocalizedString("word_2", comment: ""),
    NSLocalizedString("word_3", comment: ""),
    NSLocalizedString("word_4", comment: ""),
    ]
    
    
    //их имена \n для разделения имени и фамилии
    @State private var Image1 : [String] = ["Baffet","Bill","Elon","Pitere"] // картинки
    
    
    
    @State private var title : [String] = [
    NSLocalizedString("word_0", comment: ""),
    NSLocalizedString("word_1", comment: ""),
    NSLocalizedString("word_2", comment: ""),
    NSLocalizedString("word_3", comment: ""),
    NSLocalizedString("word_4", comment: ""),
    ]
    
    
    
    //заголовок статьи
    @State private var Image2 : [String] = ["Baffet","Bill","Elon","Pitere"] // картинка
    @State private var Text1 : [String] = [
        NSLocalizedString("word_0", comment: ""),
        NSLocalizedString("word_1", comment: ""),
        NSLocalizedString("word_2", comment: ""),
        NSLocalizedString("word_3", comment: ""),
        NSLocalizedString("word_4", comment: ""),
        ] // основной текст
    
    var body: some View {
        ZStack{
            Color("Color_back")
                .edgesIgnoringSafeArea(.all)
            NavigationStack{
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing:20){
                        ForEach(0..<4) { index in
                            NavigationLink {
                                ZStack{
                                    Color("Color_back")
                                        .edgesIgnoringSafeArea(.all)
                                    ScrollView{
                                        LazyVStack(alignment: .leading){
                                            Text(title[index])
                                            Image(Image2[index])
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                            
                                            Text(Text1[index])
                                                
                                            
                                            
                                        }
                                    }.padding(.horizontal,15)
                                }
                                
                            } label: {
                                
                                
                                ZStack{
                                    
                                    
                                    Image(Image1[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    VStack{
                                        HStack{
                                            Text(name[index])
                                                .font(.system(size: 44,weight: .medium))
                                            Spacer()
                                        }
                                    }.padding(.horizontal,30)
                                }.frame(height: 200)
                            }
                        }
                        
                    }
                }.padding(.horizontal,15)
                
            }
            
        }
    }
}

struct Famous_Screen_Previews: PreviewProvider {
    static var previews: some View {
        Famous_Screen()
    }
}
