import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListViewModel: FilmListViewModel
    
    
    @State private var search: String = ""
    
    
    init() {
        self.filmListViewModel = FilmListViewModel()
        self.filmListViewModel.filmAramasıYap(filmIsmi: "search")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                TextField("Arama yap...", text: $search)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: search) { newValue in
                        self.filmListViewModel.filmAramasıYap(filmIsmi: search.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? search)
                    }
                
                List(filmListViewModel.filmler, id: \.imdbId) { film in
                    
                    
                    
                    NavigationLink {
                        DetailView(imdbId: film.imdbId)
                        
                    } label: {
                        HStack {
                            // Resimleri asenkron olarak yükle
                            AsyncImage(url: URL(string: film.poster)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(width: 100, height: 120)
                                case .failure:
                                    Text("Resim Yüklenemedi")
                                @unknown default:
                                    Text("Bilinmeyen Durum")
                                }
                            }
                            VStack(alignment: .leading) {
                                Text(film.title)
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(Color.blue)
                                    
                                
                                Text(film.year)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color.orange)
                            }
                        }
                    }

                    
                    
                }
            }
            .navigationBarTitle("Film Kitabı", displayMode: .inline)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}

