

import Foundation
struct InstructorVideosCollection : Codable {
	let videoId : Int?
	let videoUrl : String?

	enum CodingKeys: String, CodingKey {

		case videoId = "videoId"
		case videoUrl = "videoUrl"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		videoId = try values.decodeIfPresent(Int.self, forKey: .videoId)
		videoUrl = try values.decodeIfPresent(String.self, forKey: .videoUrl)
	}

}
