import Foundation

class NetworkManager {
    //making NetworkManager singleton class
    static var shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init() {}
    
    func getUserFollowers(userName: String,
                          pageNumber: Int,
                          completion: @escaping([GithubUser]?, ErrorMessage?) -> Void) {
//        let endPointURLString = baseURL + "\(userName)/followers?per_page=25&pages=\(pageNumber)"
        
        var endURLComponents = URLComponents()
        endURLComponents.scheme = "https"
        endURLComponents.host = "api.github.com"
        endURLComponents.path = "/users/"
        endURLComponents.path += "\(userName)/followers"
        endURLComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "20"),
            URLQueryItem(name: "page", value: String(pageNumber))
        ]
        
        
        guard let endPointURLString = endURLComponents.string, let endPointURL = URL(string: endPointURLString) else {
            completion(nil, .invalidURLRequest)
            return
        }
        
        //API Code
        print(endPointURL)
        let urlRequest = URLRequest(url: endPointURL)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                completion(nil, .invalidURLRequest)
                return
            }
            
            guard let actualRespose = response as? HTTPURLResponse, actualRespose.statusCode == 200 else {
                completion(nil, .invalidHTTPResponse)
                return
            }
            
            guard let actualData = data else {
                completion(nil, .InvalidData)
                return
            }
            
            do {
                let customDecoder = JSONDecoder()
                customDecoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let followers = try customDecoder.decode([GithubUser].self, from: actualData)
                completion(followers, nil)
            } catch {
                completion(nil, .invalidDecoding)
            }
        }
        
        task.resume()
    }
    
}



