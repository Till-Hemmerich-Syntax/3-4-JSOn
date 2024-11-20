//
//  ContentView.swift
//  3-4-JSOn
//
//  Created by Till Hemmerich on 19.11.24.
//

import SwiftUI



struct ContentView: View {
    @State var parkPlaetze : [ParkPlatz] = []
    @State var autobahnNummer : String = "1"
    var body: some View {
        VStack {
            List{
                HStack{
                    TextField("A:", text: $autobahnNummer)
                    Button("Search"){callAPI()}
                }
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
            //fetchDataFromJSON()
            callAPI()
        }
        
    }
    
    func callAPI()
    {
        Task{
            do{
                try await getDataFromAPI()
            } catch let error as HTTPError{
                print(error.message)
            }
        }
    }
    // diese Funktion fragt die Daten von einer von uns spezifiezierten URL ab, sollte die URL ingültig sein gibt sie einen invalidURL error.
    // nach der Abfrage werden die Daten Decodiert und in die Parkplatz Variable gepackt.
    func getDataFromAPI() async throws{
        
        let urlString = "https://verkehr.autobahn.de/o/autobahn/A\(autobahnNummer)/services/parking_lorry"
        guard let url = URL(string: urlString)else{
            throw HTTPError.invalidURL
        }
        let(data,_) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ParkingInfo.self, from: data)
        self.parkPlaetze = response.parkPlaetze
        
    }
    
    // diese Funktion fragt die Daten von unserer Localen Json Datei ab und packt das ergebniss nach dem Decodieren in die Parkplatz >Variable.
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
