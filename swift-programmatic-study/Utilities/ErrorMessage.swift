// TODO: Associated Values
enum ErrorMessage: String {
    case invalidUsername = "This username created an invalid request"
    case unableToComplete = "Unable to complete your request"
    case invalidResponse = "Invalid response"
    case invalidData = "Invalid data"
}

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request"
    case unableToComplete = "Unable to complete your request"
    case invalidResponse = "Invalid response"
    case invalidData = "Invalid data"
}
