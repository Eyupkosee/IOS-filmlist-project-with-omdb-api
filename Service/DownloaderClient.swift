//
//  DownloaderClient.swift
//  Filmlist
//
//  Created by eyüp köse on 20.09.2023.
//

import Foundation

class DownloaderClient {
    
    func filmleriIndir(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string:"https://www.omdbapi.com/?s=\(search)&apikey=1b848c8a") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabı = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(filmCevabı.filmler))
        }.resume() // URLSession.shared.dataTask'ı başlatmak için .resume() kullanılmalıdır.
    }
    
    func filmDetailDownload(imdbId: String, completion: @escaping (Result<FilmDetail, DownloaderError>) -> Void) {
        
        guard let url = URL(string:"https://www.omdbapi.com/?i=\(imdbId)&apikey=1b848c8a") else {
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmedi))
            }
             
            guard let gelenFilmDetayı = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            completion(.success(gelenFilmDetayı))
        }.resume() // URLSession.shared.dataTask'ı başlatmak için .resume() kullanılmalıdır.
        
        
        
        
    }

    
    enum DownloaderError: Error {
        case yanlisUrl
        case veriGelmedi
        case veriIslenemedi
    }
}

