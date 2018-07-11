
import Foundation
struct SkillsCollection : Codable {
	let skillId : Int?
	let skillValue : String?

	enum CodingKeys: String, CodingKey {

		case skillId = "skillId"
		case skillValue = "skillValue"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		skillId = try values.decodeIfPresent(Int.self, forKey: .skillId)
		skillValue = try values.decodeIfPresent(String.self, forKey: .skillValue)
	}

}
