struct SAAddProductTemplate: Codable {
    let keyID: Int
    let keyName, displayName: String
    let format, access: Int
    let templateDefault: [AnyValue]?
    let templateRequired, reqInventory, reqStore, reqUser: Bool
    let isSearchable: Bool
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case keyID = "key_id"
        case keyName = "key_name"
        case displayName = "display_name"
        case format, access
        case templateDefault = "default"
        case templateRequired = "required"
        case reqInventory = "req_inventory"
        case reqStore = "req_store"
        case reqUser = "req_user"
        case isSearchable = "is_searchable"
        case description
    }
}
enum AnyValue:Codable {
    
    case int(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self = try .int(container.decode(Int.self))
        } catch DecodingError.typeMismatch {
            do {
                self = try .string(container.decode(String.self))
            } catch DecodingError.typeMismatch {
                throw DecodingError.typeMismatch(AnyValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Encoded payload not of an expected type"))
            }
        }
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .int(let int):
            try container.encode(int)
        case .string(let string):
            try container.encode(string)
        }
        
    }
    
    
    
    
}
