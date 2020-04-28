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
    let apiKey:Parameters = ["api_key": "0267c13d8c7d1dcddb40001ba6372235"]
    let imgURL:String = "https://image.tmdb.org/t/p/w185"
    
    init() {}
    
    func LoadHomeDataFromAPI(completion: @escaping( _ data:[MovieListModel]) -> Void){
        DispatchQueue.main.async {
            var popularData: [MovieListModel] = []
            AF.request(self.popularUrl,method: .get,parameters: self.apiKey,encoding: URLEncoding(destination: .queryString), headers: nil).validate().responseJSON { (response) in
                switch response.result {
                case .success(_):
                    if let json = try? JSON(data: response.data!) {
                        let dataResult = json["results"]
                        for i in 0...json["results"].count {
                            let imgURLMovie = self.imgURL + dataResult[i]["poster_path"].stringValue
                            let movie = MovieListModel(title: dataResult[i]["title"].stringValue, releaseDate: dataResult[i]["release_date"].stringValue, rating: dataResult[i]["vote_average"].stringValue, overview: dataResult[i]["overview"].stringValue, imgMovieURL: imgURLMovie)
                            popularData.append(movie)
                            
                        }
                    }
                    completion(popularData)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
        
        
    }
    
}
