// TODO: What is @escaping
// TODO: URL -> Networking code analysis
// TODO: guard let

import Foundation

/// This is Network Manager class refactored using enum values to represent error messages
class NetworkManagerV2 {
    // create NetworkManager instance named shared (using it all around)
    static let shared = NetworkManagerV2()
    let baseURL = "https://api.github.com/users/"

    private init() {}

    // Function for fetch followers of username
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"

        // Check url is valid
        guard let url = URL(string: endpoint) else {
            completed(nil, .invalidUsername)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            // Just for check
            if let _ = error {
                completed(nil, .unableToComplete)
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, .invalidResponse)
                return
            }

            guard let data = data else {
                completed(nil, .invalidData)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // decode JSON to [Follower] types
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, .invalidData)
            }
        }

        task.resume()
    }
}
