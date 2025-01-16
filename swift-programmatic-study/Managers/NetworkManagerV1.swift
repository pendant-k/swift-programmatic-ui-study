// TODO: What is @escaping
// TODO: URL -> Networking code analysis
// TODO: guard let

import Foundation
/// This is basic network manager pattern used in swift environment
class NetworkManagerV1 {
    // create NetworkManager instance named shared (using it all around)
    static let shared = NetworkManagerV1()
    let baseURL = "https://api.github.com/users/"

    private init() {}

    // Function for fetch followers of username
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"

        // Check url is valid
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            // Just for check
            if let _ = error {
                completed(nil, "Unable to complete your request. Check your Network")
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server.")
                return
            }

            guard let data = data else {
                completed(nil, "Data received from the server was invalid.")
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                // decode JSON to [Follower] types
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "JSON decoding is failed")
            }
        }

        task.resume()
    }
}
