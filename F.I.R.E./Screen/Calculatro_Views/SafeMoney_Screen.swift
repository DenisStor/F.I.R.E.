//
//  safemoney_2.swift
//  F.I.R.E.
//
//  Created by Никита Малыхин on 23.05.2023.
//

import SwiftUI
import Combine

struct SafeMoney_Screen: View {
    
    @StateObject var data = Calculator()
    @AppStorage ("earnMoney") var earnMoney : String = "" // строка зарабаток
    @AppStorage ("spendMoney") var spendMoney : String = "" // строка трат
    let characterLimit = 8 // кол-во символов
    @FocusState var isInputActive: Bool
    @FocusState var isInputActive_1: Bool
    
    @State private var Total : Double = 0
    
    @State private var anim = false
   
    var body: some View {
        ZStack {
            Color("Color_back")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color("Color_font_1"))
                        .frame(height: 179)
                    VStack {
                        HStack {
                            Text("safeMoney1")
                                .font(.system(size: 30, weight: .medium))
                                .foregroundColor(Color("Color_font_2"))
                            
                            Spacer()
                        }
                        
                        HStack {
                            TextField("safeMoney2", text: $earnMoney)
                                .onReceive(Just(earnMoney)) { index in
                                    
                                    if TextIs(earnMoney) {
                                        limitDigits(characterLimit)
                                    }
                                    else {
                                        earnMoney = ""
                                    }
                                    
                                }
                            
                                .font(.system(size: 25))
                                .frame(height: 45)
                                .padding(.horizontal,15)
                                .foregroundColor(Color("Color_black"))
                                .background{
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundColor(Color("Color_font_2"))
                                }
                                .keyboardType(.numberPad)
                                .focused($isInputActive)
                            
                            
                            Text("valuta")
                                .font(.system(size: 30,weight: .medium))
                                .foregroundColor(Color("Color_font_2"))
                            Spacer()
                            
                            
                            
                        }
                        
                        
                        
                        
                    }  .padding(.horizontal,15) // 1 колонка
                    
                    
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color("Color_Start"))
                        .frame(height: 233)
                    VStack {
                        HStack {
                            Text("safeMoney3")
                                .font(.system(size: 30, weight: .medium))
                                .foregroundColor(Color("Color_font"))
                            
                            Spacer()
                        }
                        
                        HStack {
                            TextField("Введите число", text: $spendMoney)
                                .onReceive(Just(spendMoney)) { index in
                                    
                                    if TextIs1(spendMoney) {
                                        limitDigits1(characterLimit)
                                    }
                                    else {
                                        spendMoney = ""
                                    }
                                    
                                }
                            .font(.system(size: 25))
                            .frame(height: 45)
                            .padding(.horizontal,15)
                            .foregroundColor(Color("Color_black"))
                            .background{
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color("Color_font_2"))
                                
                            }
                            .keyboardType(.numberPad)
                            .focused($isInputActive)
                            
                            
                            Text("valuta")
                                .font(.system(size: 30,weight: .medium))
                                .foregroundColor(Color("Color_font"))
                            Spacer()
                            
                            
                        }
                        
                        
                        
                        
                    }  .padding(.horizontal,15) // 1 колонка
                    
                    
                    
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color("Color_Start"))
                        .frame(height: 250)
                    ZStack {
                        
                        VStack ( spacing : anim ? 20 : 0) {
                            
                            HStack {
                                @AppStorage ("totalspend") var totalSpend = formatCurrency(_: Total)
                                Text("\(formatCurrency(_: Total))")
                                    .font(.system(size: 50, weight: .medium))
                                    .foregroundColor(Color("Color_font_1"))
                                    .lineLimit(anim ? 2:1)
                                    .onChange(of: earnMoney) { _ in
                                        updateTotal()
                                    }
                                    .onChange(of: spendMoney) { _ in
                                        updateTotal()
                                    }
                                    .onAppear {
                                        updateTotal()
                                    }
                                    .onTapGesture {
                                        anim.toggle()
                                        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { _ in
                                            anim = false
                                        }
                                    }
                                    .textSelection(.enabled)
                                
                                Spacer()
                                
                                
                            }
                            ZStack {
                                VStack {
                                    
                                    HStack {
                                        Text("safeMoney4")
                                            .font(.system(size: 34, weight: .medium))
                                            .foregroundColor(Color("Color_font"))
                                        
                                        Spacer()
                                        
                                        
                                    }
                                }
                            }
                        }  .padding(.horizontal,15)
                    }.animation(.spring(), value: anim)
                }
            }.padding(.horizontal,15)
        }
        
        
        
        
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                if isInputActive {
                    Button("Done") {
                        isInputActive = false
                    }
                } else {
                    Button("Done") {
                        isInputActive_1 = false
                    }
                }
            }
        }
        
    }
    
    func TextIs(_ upper: String) -> Bool {
        
        for character in earnMoney {
            if character.isLetter {
                print("Ошибка: символ '\(character)' является буквой")
                return false
            } else if character.isNumber {
                print("Символ '\(character)' является цифрой")
                
            }
        }
        return true
    }

    func limitDigits(_ upper: Int) {
        let digitOnly = earnMoney.filter {$0.isNumber }
        if digitOnly.count > upper {
            earnMoney = String(digitOnly.prefix(upper))
        }
    }
    func TextIs1(_ upper: String) -> Bool {
        
        for character in spendMoney {
            if character.isLetter {
                print("Ошибка: символ '\(character)' является буквой")
                return false
            } else if character.isNumber {
                print("Символ '\(character)' является цифрой")
                
            }
        }
        return true
    }

    func limitDigits1(_ upper: Int) {
        let digitOnly = spendMoney.filter {$0.isNumber }
        if digitOnly.count > upper {
            spendMoney = String(digitOnly.prefix(upper))
        }
    }
    
    
    func formatCurrency(_ number: Double) -> String {
        let formatforvalute = NumberFormatter()
        formatforvalute.numberStyle = .currency
        
        
        let locale = Locale.current
        
        
        formatforvalute.locale = locale
        
        return formatforvalute.string(from: NSNumber(value: number)) ?? ""
    }
    func updateTotal() {
        Total = Double(data.spendEarn(earn: Float(earnMoney) ?? 0, spend: Float(spendMoney) ?? 0))
    }

}
    
    
    struct SafeMoney_Screen_Previews: PreviewProvider {
        static var previews: some View {
            SafeMoney_Screen()
            
        }
    }

