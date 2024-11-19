//
//  ContentView.swift
//  3-4-JSOn
//
//  Created by Till Hemmerich on 19.11.24.
//

import SwiftUI



struct ContentView: View {
    @State var parkPlaetze : [ParkPlatz] = []
    var body: some View {
        VStack {
            List{
                ForEach(parkPlaetze, id: \.self){ parkPlatz in
                    VStack{
                        HStack{
                            Text(parkPlatz.title)
                            Text(parkPlatz.subtitle)
                        }
                        Text("Freie Plätze:")
                        HStack{
                            ForEach(parkPlatz.description.indices){
                                Text(parkPlatz.description[$0])
                            }
                        }
                    }
                }
            }
        }.task {
            fetchDataFromJSON()
        }
        
    }
   
    
    func fetchDataFromJSON(){
        guard let path = Bundle.main.path(forResource: "parking", ofType: "json") else{
            print("konnte nicht gelanden werden")
            return
        }
        
        do{
            let data = try Data(contentsOf: URL(filePath: path))
            let response = try JSONDecoder().decode(ParkingInfo.self , from: data)
            self.parkPlaetze = response.parkPlaetze
            print(parkPlaetze)
        }
        catch{
            print("Error : \(error)")
            return
        }
    }
    
}

#Preview {
    ContentView()
}
