// TODO: What is @escaping
// TODO: URL -> Networking code analysis
// TODO: guard let

import Foundation

class NetworkManager {
    // create NetworkManager instance named shared (using it all around)
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"

    private init() {}

    // Function for fetch followers of username
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"

        // Check url is valid
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            // Just for check
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // decode JSON to [Follower] types
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
}
