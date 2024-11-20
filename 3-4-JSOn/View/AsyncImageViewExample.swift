//
//  AsyncImageViewExample.swift
//  3-4-JSOn
//
//  Created by Till Hemmerich on 20.11.24.
//

import SwiftUI

struct AsyncImageViewExample: View {
    let url = URL(string: "https://images.metmuseum.org/CRDImages/eg/original/Gallery_102_3623.jpg")
    let url2 = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMNF4q4CeyXiC1hOUOnUUtRiQmlSV1SfTssg&s")
    var body: some View {
        VStack{
            AsyncImage(url: url){ image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            } placeholder:{
                ProgressView()
                    .frame(width: 200, height: 200)
            }
            AsyncImage(url: url2){ image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            } placeholder:{
                ProgressView()
                    .frame(width: 200, height: 200)
            }
            
        }
    }
}

#Preview {
    AsyncImageViewExample()
}
