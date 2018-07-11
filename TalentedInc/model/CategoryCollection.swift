

import Foundation
struct CategoryCollection : Codable {
	let categoryId : Int?
	let name : String?
	let imageUrl : String?

	enum CodingKeys: String, CodingKey {

		case categoryId = "categoryId"
		case name = "name"
		case imageUrl = "imageUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		categoryId = try values.decodeIfPresent(Int.self, forKey: .categoryId)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
	}

}
