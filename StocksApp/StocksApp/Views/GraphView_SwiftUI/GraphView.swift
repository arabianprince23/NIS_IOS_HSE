//
//  GraphView.swift
//  StocksApp
//
//  Created by Анас Бен Мустафа on 1/31/21.
//

import SwiftUI
import SwiftUICharts

struct GraphView: View {
    
    var ticker: String = ""
    let graphPoints: [Double]
    
    init (ticker: String, points: [Double]) {
        self.ticker = ticker
        self.graphPoints = points
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                HStack {
                    VStack (spacing: 5) {
                        Image(systemName: "chevron.compact.down")
                            .font(.system(size: 40))
                            .foregroundColor(Color.init(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                        Text("Swipe down to close")
                            .font(.system(size: 10))
                            .foregroundColor(Color.init(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    }
                }
                .padding()
                VStack {
                    LineView(data: graphPoints, title: "График \(ticker)", legend: "Ниже представлен график за 3 месяца:")
                        .frame(height: 400)
                    
                    HStack {
                        Text("Проведите по графику для деталей.")
                            .font(.system(size: 16))
                            .foregroundColor(Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        Spacer()
                    }
                }
            }
            .padding()
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView(ticker: "AAPL", points: [140, 137, 138, 135, 137, 133, 138, 142])
    }
}
