import Foundation

struct LoginModel: Codable { //Codable 알아오기
    let access_token: String
    let refresh_token: String
}
