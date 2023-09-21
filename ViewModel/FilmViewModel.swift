//
//  FilmViewModel.swift
//  Filmlist
//
//  Created by eyüp köse on 20.09.2023.
//

import Foundation
import SwiftUI

class FilmListViewModel : ObservableObject {
    
    @Published var filmler = [Film]()
    let downloadClient = DownloaderClient()
    
    func filmAramasıYap(filmIsmi : String){
        downloadClient.filmleriIndir(search: filmIsmi) { sonuc in
            switch sonuc {
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi{
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi                    }
                }
            case .failure(let hata):
                print(hata)
            }
        }
    }
}
