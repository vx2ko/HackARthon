//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateLocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String, long: Double? = nil, lat: Double? = nil, modelName: String? = nil, imageName: String? = nil) {
    graphQLMap = ["id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var long: Double? {
    get {
      return graphQLMap["long"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "long")
    }
  }

  public var lat: Double? {
    get {
      return graphQLMap["lat"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lat")
    }
  }

  public var modelName: String? {
    get {
      return graphQLMap["modelName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "modelName")
    }
  }

  public var imageName: String? {
    get {
      return graphQLMap["imageName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "imageName")
    }
  }
}

public struct UpdateLocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
    graphQLMap = ["id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var long: Int? {
    get {
      return graphQLMap["long"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "long")
    }
  }

  public var lat: Int? {
    get {
      return graphQLMap["lat"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lat")
    }
  }

  public var modelName: String? {
    get {
      return graphQLMap["modelName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "modelName")
    }
  }

  public var imageName: String? {
    get {
      return graphQLMap["imageName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "imageName")
    }
  }
}

public struct DeleteLocationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelLocationFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, name: ModelStringFilterInput? = nil, long: ModelIntFilterInput? = nil, lat: ModelIntFilterInput? = nil, modelName: ModelStringFilterInput? = nil, imageName: ModelStringFilterInput? = nil, and: [ModelLocationFilterInput?]? = nil, or: [ModelLocationFilterInput?]? = nil, not: ModelLocationFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringFilterInput? {
    get {
      return graphQLMap["name"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var long: ModelIntFilterInput? {
    get {
      return graphQLMap["long"] as! ModelIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "long")
    }
  }

  public var lat: ModelIntFilterInput? {
    get {
      return graphQLMap["lat"] as! ModelIntFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lat")
    }
  }

  public var modelName: ModelStringFilterInput? {
    get {
      return graphQLMap["modelName"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "modelName")
    }
  }

  public var imageName: ModelStringFilterInput? {
    get {
      return graphQLMap["imageName"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "imageName")
    }
  }

  public var and: [ModelLocationFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelLocationFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelLocationFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelLocationFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelLocationFilterInput? {
    get {
      return graphQLMap["not"] as! ModelLocationFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelIntFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, contains: Int? = nil, notContains: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: Int? {
    get {
      return graphQLMap["contains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: Int? {
    get {
      return graphQLMap["notContains"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public final class CreateLocationMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateLocation($input: CreateLocationInput!) {\n  createLocation(input: $input) {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public var input: CreateLocationInput

  public init(input: CreateLocationInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createLocation", arguments: ["input": GraphQLVariable("input")], type: .object(CreateLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createLocation: CreateLocation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createLocation": createLocation.flatMap { $0.snapshot }])
    }

    public var createLocation: CreateLocation? {
      get {
        return (snapshot["createLocation"] as? Snapshot).flatMap { CreateLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createLocation")
      }
    }

    public struct CreateLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}

public final class UpdateLocationMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateLocation($input: UpdateLocationInput!) {\n  updateLocation(input: $input) {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public var input: UpdateLocationInput

  public init(input: UpdateLocationInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateLocation", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateLocation: UpdateLocation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateLocation": updateLocation.flatMap { $0.snapshot }])
    }

    public var updateLocation: UpdateLocation? {
      get {
        return (snapshot["updateLocation"] as? Snapshot).flatMap { UpdateLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateLocation")
      }
    }

    public struct UpdateLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}

public final class DeleteLocationMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteLocation($input: DeleteLocationInput!) {\n  deleteLocation(input: $input) {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public var input: DeleteLocationInput

  public init(input: DeleteLocationInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteLocation", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteLocation: DeleteLocation? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteLocation": deleteLocation.flatMap { $0.snapshot }])
    }

    public var deleteLocation: DeleteLocation? {
      get {
        return (snapshot["deleteLocation"] as? Snapshot).flatMap { DeleteLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteLocation")
      }
    }

    public struct DeleteLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}

public final class GetLocationQuery: GraphQLQuery {
  public static let operationString =
    "query GetLocation($id: ID!) {\n  getLocation(id: $id) {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getLocation", arguments: ["id": GraphQLVariable("id")], type: .object(GetLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getLocation: GetLocation? = nil) {
      self.init(snapshot: ["__typename": "Query", "getLocation": getLocation.flatMap { $0.snapshot }])
    }

    public var getLocation: GetLocation? {
      get {
        return (snapshot["getLocation"] as? Snapshot).flatMap { GetLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getLocation")
      }
    }

    public struct GetLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}

public final class ListLocationsQuery: GraphQLQuery {
  public static let operationString =
    "query ListLocations($filter: ModelLocationFilterInput, $limit: Int, $nextToken: String) {\n  listLocations(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      long\n      lat\n      modelName\n      imageName\n    }\n    nextToken\n  }\n}"

  public var filter: ModelLocationFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelLocationFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listLocations", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listLocations: ListLocation? = nil) {
      self.init(snapshot: ["__typename": "Query", "listLocations": listLocations.flatMap { $0.snapshot }])
    }

    public var listLocations: ListLocation? {
      get {
        return (snapshot["listLocations"] as? Snapshot).flatMap { ListLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listLocations")
      }
    }

    public struct ListLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelLocationConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelLocationConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("long", type: .scalar(Int.self)),
          GraphQLField("lat", type: .scalar(Int.self)),
          GraphQLField("modelName", type: .scalar(String.self)),
          GraphQLField("imageName", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
          self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var long: Int? {
          get {
            return snapshot["long"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "long")
          }
        }

        public var lat: Int? {
          get {
            return snapshot["lat"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "lat")
          }
        }

        public var modelName: String? {
          get {
            return snapshot["modelName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "modelName")
          }
        }

        public var imageName: String? {
          get {
            return snapshot["imageName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "imageName")
          }
        }
      }
    }
  }
}

public final class OnCreateLocationSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateLocation {\n  onCreateLocation {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateLocation", type: .object(OnCreateLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateLocation: OnCreateLocation? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateLocation": onCreateLocation.flatMap { $0.snapshot }])
    }

    public var onCreateLocation: OnCreateLocation? {
      get {
        return (snapshot["onCreateLocation"] as? Snapshot).flatMap { OnCreateLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateLocation")
      }
    }

    public struct OnCreateLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}

public final class OnUpdateLocationSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateLocation {\n  onUpdateLocation {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateLocation", type: .object(OnUpdateLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateLocation: OnUpdateLocation? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateLocation": onUpdateLocation.flatMap { $0.snapshot }])
    }

    public var onUpdateLocation: OnUpdateLocation? {
      get {
        return (snapshot["onUpdateLocation"] as? Snapshot).flatMap { OnUpdateLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateLocation")
      }
    }

    public struct OnUpdateLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}

public final class OnDeleteLocationSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteLocation {\n  onDeleteLocation {\n    __typename\n    id\n    name\n    long\n    lat\n    modelName\n    imageName\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteLocation", type: .object(OnDeleteLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteLocation: OnDeleteLocation? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteLocation": onDeleteLocation.flatMap { $0.snapshot }])
    }

    public var onDeleteLocation: OnDeleteLocation? {
      get {
        return (snapshot["onDeleteLocation"] as? Snapshot).flatMap { OnDeleteLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteLocation")
      }
    }

    public struct OnDeleteLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["Location"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("long", type: .scalar(Int.self)),
        GraphQLField("lat", type: .scalar(Int.self)),
        GraphQLField("modelName", type: .scalar(String.self)),
        GraphQLField("imageName", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, long: Int? = nil, lat: Int? = nil, modelName: String? = nil, imageName: String? = nil) {
        self.init(snapshot: ["__typename": "Location", "id": id, "name": name, "long": long, "lat": lat, "modelName": modelName, "imageName": imageName])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var long: Int? {
        get {
          return snapshot["long"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "long")
        }
      }

      public var lat: Int? {
        get {
          return snapshot["lat"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "lat")
        }
      }

      public var modelName: String? {
        get {
          return snapshot["modelName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "modelName")
        }
      }

      public var imageName: String? {
        get {
          return snapshot["imageName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "imageName")
        }
      }
    }
  }
}