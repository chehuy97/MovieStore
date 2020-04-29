//
//  APIService.swift
//  MovieStore
//
//  Created by Arthur on 4/28/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    static let sharedInstance = APIService()
    let popularUrl:String = "https://api.themoviedb.org/3/movie/popular"
    let nowPlayingURL:String = "https://api.themoviedb.org/3/movie/now_playing"
    let topRatedURL:String = "https://api.themoviedb.org/3/movie/top_rated"
    let upcommingURL:String = "https://api.themoviedb.org/3/movie/upcoming"
    let movieDetailUrl = "https://api.themoviedb.org/3/movie/"
    let apiKey:Parameters = ["api_key": "0267c13d8c7d1dcddb40001ba6372235"]
    let searchUrl = "https://api.themoviedb.org/3/search/movie"
    let imgURL:String = "https://image.tmdb.org/t/p/w185"
    
    private init() {}
    
    func LoadHomeDataFromAPI(Filter filter:Int, SortBy sortBy:Int, Rating rating:Float, ReleaseYear releaseYear:String, completion: @escaping( _ data:[MovieListModel]) -> Void){
        var homeUrl:String = popularUrl
        if filter == 1 {
            homeUrl = nowPlayingURL
        }
        if filter == 2 {
            homeUrl = topRatedURL
        }
        if filter == 3 {
            homeUrl = upcommingURL
        }
        DispatchQueue.main.async {
            var movieData: [MovieListModel] = []
            AF.request(homeUrl,method: .get,parameters: self.apiKey,encoding: URLEncoding(destination: .queryString), headers: nil).validate().responseJSON { (response) in
                switch response.result {
                case .success(_):
                    if let json = try? JSON(data: response.data!) {
                        let dataResult = json["results"]
                        for i in 0...json["results"].count {
                            let imgURLMovie = self.imgURL + dataResult[i]["poster_path"].stringValue
                            let movie = MovieListModel(title: dataResult[i]["title"].stringValue, releaseDate: dataResult[i]["release_date"].stringValue, rating: dataResult[i]["vote_average"].floatValue, overview: dataResult[i]["overview"].stringValue, imgMovieURL: imgURLMovie, id: dataResult[i]["id"].stringValue)
                            if (movie.rating > rating) && (releaseYear == "none"){
                                movieData.append(movie)
                            }
                            if (movie.rating > rating) && (releaseYear != "none"){
                                if movie.releaseDate.hasPrefix(releaseYear) {
                                    movieData.append(movie)
                                }
                            }
                        }
                        if sortBy == 0 {
                            movieData.sort {
                                $0.releaseDate < $1.releaseDate
                            }
                        }
                        if sortBy == 1 {
                            movieData.sort {
                                $0.rating < $1.rating
                            }
                        }
                    }
                    completion(movieData)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
    
    func loadFilmDetailFromAPI(MovieId movie_id:String, completion: @escaping(_ data:MovieDetailModel) -> Void){
        DispatchQueue.main.async {
            var filmDetailData:MovieDetailModel!
            let url:String = self.movieDetailUrl + movie_id
            AF.request(url, method:  .get, parameters: self.apiKey, encoding:  URLEncoding(destination: .queryString), headers: nil).validate().responseJSON { (response) in
                switch response.result {
                case .success(_):
                    if let json = try? JSON(data: response.data!){
                        var cast:[CastCrewModel] = []
                        for i in 0...json["production_companies"].count {
                            let castImage:String = self.imgURL + json["production_companies"][i]["logo_path"].stringValue
                            let castItem:CastCrewModel = CastCrewModel(castImage: castImage, catsName: json["production_companies"][i]["name"].stringValue)
                            cast.append(castItem)
                        }
                        let movieImage:String = self.imgURL + json["poster_path"].stringValue
                        filmDetailData = MovieDetailModel(title: json["title"].stringValue,releaseDate: json["release_date"].stringValue, rating: json["vote_average"].floatValue, overview: json["overview"].stringValue, imgMovie: movieImage, production: cast)
                    }
                    print(filmDetailData!)
                    completion(filmDetailData)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
    
}
