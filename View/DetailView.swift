//
//  DetailView.swift
//  Filmlist
//
//  Created by eyüp köse on 21.09.2023.
//

import SwiftUI

struct DetailView: View {
    let imdbId : String
    
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    var body: some View {
        VStack{
            // Resimleri asenkron olarak yükle
            AsyncImage(url: URL(string: filmDetailViewModel.filmDetayı?.poster ?? "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 320)
                case .failure:
                    Text("Resim Yüklenemedi")
                @unknown default:
                    Text("Bilinmeyen Durum")
                }
                
                // FİLM ADI
                Text(filmDetailViewModel.filmDetayı?.title ?? "Film ismi")
                    .font(.title)
                    .italic()
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                
                VStack{
                    //yıl
                    Text(filmDetailViewModel.filmDetayı?.year ?? "asdasdasdasd")
                        .padding(.leading,UIScreen.main.bounds.width * 0.8)
                        .foregroundColor(.gray)
                        
                }
                
                    
                
                
                //FİLM TANIMI
                Text(filmDetailViewModel.filmDetayı?.plot ?? "asdasdasdasd")
                    .padding(.top,10)
                    .padding(.bottom,30)
                
                //YÖNETMEN
                Text("Yönetmen : \(filmDetailViewModel.filmDetayı?.director ?? "asdasdasdasd")")
                    .padding(.trailing)
                    .foregroundColor(.gray)
                
                //OYUNCULAR
                Text("Kadro : \(filmDetailViewModel.filmDetayı?.actors ?? "asdasdasdasd")")
                    .padding(.trailing)
                    .foregroundColor(.gray)
                    .padding(.top,10)
                    .multilineTextAlignment(.center)

                    
                
                
            };Spacer()
            
            
        }
        .onAppear(perform: {
            self.filmDetailViewModel.filmDetayiAl(imdbId: imdbId)
        })
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "test")
    }
}
