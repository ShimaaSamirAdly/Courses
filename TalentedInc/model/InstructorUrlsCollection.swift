

import Foundation
struct InstructorUrlsCollection : Codable {
	let urlValue : String?
	let urlId : Int?

	enum CodingKeys: String, CodingKey {

		case urlValue = "urlValue"
		case urlId = "urlId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		urlValue = try values.decodeIfPresent(String.self, forKey: .urlValue)
		urlId = try values.decodeIfPresent(Int.self, forKey: .urlId)
	}

}
