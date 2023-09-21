//
//  FilmDetailViewModel.swift
//  Filmlist
//
//  Created by eyüp köse on 21.09.2023.
//

import Foundation
import SwiftUI

class FilmDetailViewModel : ObservableObject{
    
    @Published var filmDetayı : FilmDetailsViewModel?
    
    let downLoaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId : String){
        downLoaderClient.filmDetailDownload(imdbId: imdbId) { sonuc in
            
            switch sonuc{
            case .failure(let hata):
                print(hata)
            case .success(let filmDetail):
                DispatchQueue.main.async {
                    // UI güncellemelerini burada yapın
                    self.filmDetayı = FilmDetailsViewModel(detay: filmDetail)
                }
                
            }
            
        }
    }
 
}

struct FilmDetailsViewModel {
    let detay : FilmDetail
    
    var title : String{
        detay.title
    }
    
    var poster : String{
        detay.poster
    }
    
    var year : String{
        detay.year
    }
    
    var imdbId : String{
        detay.imdbId
    }
    
    var director : String{
        detay.director
    }
    
    var actors : String{
        detay.actors
    }
    
    var writer : String{
        detay.writer
    }
    
    var plot : String{
        detay.plot
    }
    
    var awards : String{
        detay.awards
    }
}
