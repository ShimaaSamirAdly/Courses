

import Foundation
struct Instructor : Codable {
	let userId : Int?
	let totalRate : Double?
	let instructorVideosCollection : [InstructorVideosCollection]?
	let skillsCollection : [SkillsCollection]?
	let instructorImagesCollection : [InstructorImagesCollection]?
	let instructorUrlsCollection : [InstructorUrlsCollection]?

	enum CodingKeys: String, CodingKey {

		case userId = "userId"
		case totalRate = "totalRate"
		case instructorVideosCollection = "instructorVideosCollection"
		case skillsCollection = "skillsCollection"
		case instructorImagesCollection = "instructorImagesCollection"
		case instructorUrlsCollection = "instructorUrlsCollection"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		totalRate = try values.decodeIfPresent(Double.self, forKey: .totalRate)
		instructorVideosCollection = try values.decodeIfPresent([InstructorVideosCollection].self, forKey: .instructorVideosCollection)
		skillsCollection = try values.decodeIfPresent([SkillsCollection].self, forKey: .skillsCollection)
		instructorImagesCollection = try values.decodeIfPresent([InstructorImagesCollection].self, forKey: .instructorImagesCollection)
		instructorUrlsCollection = try values.decodeIfPresent([InstructorUrlsCollection].self, forKey: .instructorUrlsCollection)
	}

}
