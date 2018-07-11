

import Foundation
struct InstructorImagesCollection : Codable {
	let imageUrl : String?
	let imgId : Int?

	enum CodingKeys: String, CodingKey {

		case imageUrl = "imageUrl"
		case imgId = "imgId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		imgId = try values.decodeIfPresent(Int.self, forKey: .imgId)
	}

}
