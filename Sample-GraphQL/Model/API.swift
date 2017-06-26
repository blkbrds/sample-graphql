//  This file was automatically generated and should not be edited.

import Apollo

/// The episodes in the Star Wars trilogy
public enum Episode: String {
  case newhope = "NEWHOPE" /// Star Wars Episode IV: A New Hope, released in 1977.
  case empire = "EMPIRE" /// Star Wars Episode V: The Empire Strikes Back, released in 1980.
  case jedi = "JEDI" /// Star Wars Episode VI: Return of the Jedi, released in 1983.
}

extension Episode: Apollo.JSONDecodable, Apollo.JSONEncodable {}

public final class HeroAndFriendsQuery: GraphQLQuery {
  public static let operationString =
    "query HeroAndFriends($episode: Episode) {" +
    "  hero(episode: $episode) {" +
    "    __typename" +
    "    name" +
    "    ... on Droid {" +
    "      __typename" +
    "      appearsIn" +
    "    }" +
    "    ...HeroDetails" +
    "    friends {" +
    "      __typename" +
    "      name" +
    "      ...HeroDetails" +
    "    }" +
    "  }" +
    "}"
  public static var requestString: String { return operationString.appending(HeroDetails.fragmentString) }

  public var episode: Episode?

  public init(episode: Episode? = nil) {
    self.episode = episode
  }

  public var variables: GraphQLMap? {
    return ["episode": episode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("hero", arguments: ["episode": Variable("episode")], type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"]! as! Snapshot?).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
        Field("friends", type: .list(.object(Hero.Friend.self))),
        FragmentSpread(Hero.AsDroid.self),
        FragmentSpread(Hero.AsHuman.self),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String, height: Double? = nil, friends: [AsHuman.Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "name": name, "height": height, "friends": friends])
      }

      public static func makeDroid(name: String, appearsIn: [Episode?], primaryFunction: String? = nil, friends: [AsDroid.Friend?]? = nil) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "name": name, "appearsIn": appearsIn, "primaryFunction": primaryFunction, "friends": friends])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      /// The friends of the character, or an empty list if they have none
      public var friends: [Friend?]? {
        get {
          return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
        }
      }

      public var asDroid: AsDroid? {
        get {
          if !AsDroid.possibleTypes.contains(__typename) { return nil }
          return AsDroid(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      public var asHuman: AsHuman? {
        get {
          if !AsHuman.possibleTypes.contains(__typename) { return nil }
          return AsHuman(snapshot: snapshot)
        }
        set {
          guard let newValue = newValue else { return }
          snapshot = newValue.snapshot
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot = newValue.snapshot
        }
      }

      public struct AsDroid: GraphQLFragment {
        public static let possibleTypes = ["Droid"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
          Field("appearsIn", type: .nonNull(.list(.scalar(Episode.self)))),
          Field("primaryFunction", type: .scalar(String.self)),
          Field("friends", type: .list(.object(AsDroid.Friend.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, appearsIn: [Episode?], primaryFunction: String? = nil, friends: [Friend?]? = nil) {
          self.init(snapshot: ["__typename": "Droid", "name": name, "appearsIn": appearsIn, "primaryFunction": primaryFunction, "friends": friends])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// What others call this droid
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        /// The movies this droid appears in
        public var appearsIn: [Episode?] {
          get {
            return snapshot["appearsIn"]! as! [Episode?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "appearsIn")
          }
        }

        /// This droid's primary function
        public var primaryFunction: String? {
          get {
            return snapshot["primaryFunction"]! as! String?
          }
          set {
            snapshot.updateValue(newValue, forKey: "primaryFunction")
          }
        }

        /// This droid's friends, or an empty list if they have none
        public var friends: [Friend?]? {
          get {
            return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var heroDetails: HeroDetails {
            get {
              return HeroDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct Friend: GraphQLSelectionSet {
          public static let possibleTypes = ["Human", "Droid"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("name", type: .nonNull(.scalar(String.self))),
            FragmentSpread(Friend.AsDroid.self),
            FragmentSpread(Friend.AsHuman.self),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public static func makeHuman(name: String, height: Double? = nil) -> Friend {
            return Friend(snapshot: ["__typename": "Human", "name": name, "height": height])
          }

          public static func makeDroid(name: String, primaryFunction: String? = nil) -> Friend {
            return Friend(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the character
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var asDroid: AsDroid? {
            get {
              if !AsDroid.possibleTypes.contains(__typename) { return nil }
              return AsDroid(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public var asHuman: AsHuman? {
            get {
              if !AsHuman.possibleTypes.contains(__typename) { return nil }
              return AsHuman(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct AsDroid: GraphQLFragment {
            public static let possibleTypes = ["Droid"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("name", type: .nonNull(.scalar(String.self))),
              Field("primaryFunction", type: .scalar(String.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, primaryFunction: String? = nil) {
              self.init(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// What others call this droid
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            /// This droid's primary function
            public var primaryFunction: String? {
              get {
                return snapshot["primaryFunction"]! as! String?
              }
              set {
                snapshot.updateValue(newValue, forKey: "primaryFunction")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var heroDetails: HeroDetails {
                get {
                  return HeroDetails(snapshot: snapshot)
                }
                set {
                  snapshot = newValue.snapshot
                }
              }
            }
          }

          public struct AsHuman: GraphQLFragment {
            public static let possibleTypes = ["Human"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("name", type: .nonNull(.scalar(String.self))),
              Field("height", type: .scalar(Double.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, height: Double? = nil) {
              self.init(snapshot: ["__typename": "Human", "name": name, "height": height])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// What this human calls themselves
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            /// Height in the preferred unit, default is meters
            public var height: Double? {
              get {
                return snapshot["height"]! as! Double?
              }
              set {
                snapshot.updateValue(newValue, forKey: "height")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var heroDetails: HeroDetails {
                get {
                  return HeroDetails(snapshot: snapshot)
                }
                set {
                  snapshot = newValue.snapshot
                }
              }
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var heroDetails: HeroDetails {
              get {
                return HeroDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }
      }

      public struct AsHuman: GraphQLFragment {
        public static let possibleTypes = ["Human"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
          Field("height", type: .scalar(Double.self)),
          Field("friends", type: .list(.object(AsHuman.Friend.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String, height: Double? = nil, friends: [Friend?]? = nil) {
          self.init(snapshot: ["__typename": "Human", "name": name, "height": height, "friends": friends])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// What this human calls themselves
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        /// Height in the preferred unit, default is meters
        public var height: Double? {
          get {
            return snapshot["height"]! as! Double?
          }
          set {
            snapshot.updateValue(newValue, forKey: "height")
          }
        }

        /// This human's friends, or an empty list if they have none
        public var friends: [Friend?]? {
          get {
            return (snapshot["friends"]! as! [Snapshot?]?).flatMap { $0.map { $0.flatMap { Friend(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "friends")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var heroDetails: HeroDetails {
            get {
              return HeroDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }

        public struct Friend: GraphQLSelectionSet {
          public static let possibleTypes = ["Human", "Droid"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("name", type: .nonNull(.scalar(String.self))),
            FragmentSpread(Friend.AsDroid.self),
            FragmentSpread(Friend.AsHuman.self),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public static func makeHuman(name: String, height: Double? = nil) -> Friend {
            return Friend(snapshot: ["__typename": "Human", "name": name, "height": height])
          }

          public static func makeDroid(name: String, primaryFunction: String? = nil) -> Friend {
            return Friend(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the character
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var asDroid: AsDroid? {
            get {
              if !AsDroid.possibleTypes.contains(__typename) { return nil }
              return AsDroid(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public var asHuman: AsHuman? {
            get {
              if !AsHuman.possibleTypes.contains(__typename) { return nil }
              return AsHuman(snapshot: snapshot)
            }
            set {
              guard let newValue = newValue else { return }
              snapshot = newValue.snapshot
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct AsDroid: GraphQLFragment {
            public static let possibleTypes = ["Droid"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("name", type: .nonNull(.scalar(String.self))),
              Field("primaryFunction", type: .scalar(String.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, primaryFunction: String? = nil) {
              self.init(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// What others call this droid
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            /// This droid's primary function
            public var primaryFunction: String? {
              get {
                return snapshot["primaryFunction"]! as! String?
              }
              set {
                snapshot.updateValue(newValue, forKey: "primaryFunction")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var heroDetails: HeroDetails {
                get {
                  return HeroDetails(snapshot: snapshot)
                }
                set {
                  snapshot = newValue.snapshot
                }
              }
            }
          }

          public struct AsHuman: GraphQLFragment {
            public static let possibleTypes = ["Human"]

            public static let selections: [Selection] = [
              Field("__typename", type: .nonNull(.scalar(String.self))),
              Field("name", type: .nonNull(.scalar(String.self))),
              Field("height", type: .scalar(Double.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(name: String, height: Double? = nil) {
              self.init(snapshot: ["__typename": "Human", "name": name, "height": height])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            /// What this human calls themselves
            public var name: String {
              get {
                return snapshot["name"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "name")
              }
            }

            /// Height in the preferred unit, default is meters
            public var height: Double? {
              get {
                return snapshot["height"]! as! Double?
              }
              set {
                snapshot.updateValue(newValue, forKey: "height")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }

            public struct Fragments {
              public var snapshot: Snapshot

              public var heroDetails: HeroDetails {
                get {
                  return HeroDetails(snapshot: snapshot)
                }
                set {
                  snapshot = newValue.snapshot
                }
              }
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var heroDetails: HeroDetails {
              get {
                return HeroDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var heroDetails: HeroDetails {
          get {
            return HeroDetails(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }
      }

      public struct Friend: GraphQLSelectionSet {
        public static let possibleTypes = ["Human", "Droid"]

        public static let selections: [Selection] = [
          Field("__typename", type: .nonNull(.scalar(String.self))),
          Field("name", type: .nonNull(.scalar(String.self))),
          FragmentSpread(Friend.AsDroid.self),
          FragmentSpread(Friend.AsHuman.self),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public static func makeHuman(name: String, height: Double? = nil) -> Friend {
          return Friend(snapshot: ["__typename": "Human", "name": name, "height": height])
        }

        public static func makeDroid(name: String, primaryFunction: String? = nil) -> Friend {
          return Friend(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the character
        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var asDroid: AsDroid? {
          get {
            if !AsDroid.possibleTypes.contains(__typename) { return nil }
            return AsDroid(snapshot: snapshot)
          }
          set {
            guard let newValue = newValue else { return }
            snapshot = newValue.snapshot
          }
        }

        public var asHuman: AsHuman? {
          get {
            if !AsHuman.possibleTypes.contains(__typename) { return nil }
            return AsHuman(snapshot: snapshot)
          }
          set {
            guard let newValue = newValue else { return }
            snapshot = newValue.snapshot
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot = newValue.snapshot
          }
        }

        public struct AsDroid: GraphQLFragment {
          public static let possibleTypes = ["Droid"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("name", type: .nonNull(.scalar(String.self))),
            Field("primaryFunction", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, primaryFunction: String? = nil) {
            self.init(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// What others call this droid
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          /// This droid's primary function
          public var primaryFunction: String? {
            get {
              return snapshot["primaryFunction"]! as! String?
            }
            set {
              snapshot.updateValue(newValue, forKey: "primaryFunction")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var heroDetails: HeroDetails {
              get {
                return HeroDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }

        public struct AsHuman: GraphQLFragment {
          public static let possibleTypes = ["Human"]

          public static let selections: [Selection] = [
            Field("__typename", type: .nonNull(.scalar(String.self))),
            Field("name", type: .nonNull(.scalar(String.self))),
            Field("height", type: .scalar(Double.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String, height: Double? = nil) {
            self.init(snapshot: ["__typename": "Human", "name": name, "height": height])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          /// What this human calls themselves
          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          /// Height in the preferred unit, default is meters
          public var height: Double? {
            get {
              return snapshot["height"]! as! Double?
            }
            set {
              snapshot.updateValue(newValue, forKey: "height")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }

          public struct Fragments {
            public var snapshot: Snapshot

            public var heroDetails: HeroDetails {
              get {
                return HeroDetails(snapshot: snapshot)
              }
              set {
                snapshot = newValue.snapshot
              }
            }
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var heroDetails: HeroDetails {
            get {
              return HeroDetails(snapshot: snapshot)
            }
            set {
              snapshot = newValue.snapshot
            }
          }
        }
      }
    }
  }
}

public final class HeroNameQuery: GraphQLQuery {
  public static let operationString =
    "query HeroName {" +
    "  hero {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("hero", type: .object(Data.Hero.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(hero: Hero? = nil) {
      self.init(snapshot: ["__typename": "Query", "hero": hero])
    }

    public var hero: Hero? {
      get {
        return (snapshot["hero"]! as! Snapshot?).flatMap { Hero(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "hero")
      }
    }

    public struct Hero: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> Hero {
        return Hero(snapshot: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class TwoHeroesQuery: GraphQLQuery {
  public static let operationString =
    "query TwoHeroes {" +
    "  r2: hero {" +
    "    __typename" +
    "    name" +
    "  }" +
    "  luke: hero(episode: EMPIRE) {" +
    "    __typename" +
    "    name" +
    "  }" +
    "}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [Selection] = [
      Field("hero", alias: "r2", type: .object(Data.R2.self)),
      Field("hero", alias: "luke", arguments: ["episode": "EMPIRE"], type: .object(Data.Luke.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(r2: R2? = nil, luke: Luke? = nil) {
      self.init(snapshot: ["__typename": "Query", "r2": r2, "luke": luke])
    }

    public var r2: R2? {
      get {
        return (snapshot["r2"]! as! Snapshot?).flatMap { R2(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "r2")
      }
    }

    public var luke: Luke? {
      get {
        return (snapshot["luke"]! as! Snapshot?).flatMap { Luke(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "luke")
      }
    }

    public struct R2: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String) -> R2 {
        return R2(snapshot: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> R2 {
        return R2(snapshot: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }

    public struct Luke: GraphQLSelectionSet {
      public static let possibleTypes = ["Human", "Droid"]

      public static let selections: [Selection] = [
        Field("__typename", type: .nonNull(.scalar(String.self))),
        Field("name", type: .nonNull(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public static func makeHuman(name: String) -> Luke {
        return Luke(snapshot: ["__typename": "Human", "name": name])
      }

      public static func makeDroid(name: String) -> Luke {
        return Luke(snapshot: ["__typename": "Droid", "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The name of the character
      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct HeroDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment HeroDetails on Character {" +
    "  __typename" +
    "  name" +
    "  ... on Droid {" +
    "    __typename" +
    "    primaryFunction" +
    "  }" +
    "  ... on Human {" +
    "    __typename" +
    "    height" +
    "  }" +
    "}"

  public static let possibleTypes = ["Human", "Droid"]

  public static let selections: [Selection] = [
    Field("__typename", type: .nonNull(.scalar(String.self))),
    Field("name", type: .nonNull(.scalar(String.self))),
    FragmentSpread(HeroDetails.AsDroid.self),
    FragmentSpread(HeroDetails.AsHuman.self),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public static func makeHuman(name: String, height: Double? = nil) -> HeroDetails {
    return HeroDetails(snapshot: ["__typename": "Human", "name": name, "height": height])
  }

  public static func makeDroid(name: String, primaryFunction: String? = nil) -> HeroDetails {
    return HeroDetails(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the character
  public var name: String {
    get {
      return snapshot["name"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var asDroid: AsDroid? {
    get {
      if !AsDroid.possibleTypes.contains(__typename) { return nil }
      return AsDroid(snapshot: snapshot)
    }
    set {
      guard let newValue = newValue else { return }
      snapshot = newValue.snapshot
    }
  }

  public var asHuman: AsHuman? {
    get {
      if !AsHuman.possibleTypes.contains(__typename) { return nil }
      return AsHuman(snapshot: snapshot)
    }
    set {
      guard let newValue = newValue else { return }
      snapshot = newValue.snapshot
    }
  }

  public struct AsDroid: GraphQLFragment {
    public static let possibleTypes = ["Droid"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("name", type: .nonNull(.scalar(String.self))),
      Field("primaryFunction", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String, primaryFunction: String? = nil) {
      self.init(snapshot: ["__typename": "Droid", "name": name, "primaryFunction": primaryFunction])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// What others call this droid
    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    /// This droid's primary function
    public var primaryFunction: String? {
      get {
        return snapshot["primaryFunction"]! as! String?
      }
      set {
        snapshot.updateValue(newValue, forKey: "primaryFunction")
      }
    }
  }

  public struct AsHuman: GraphQLFragment {
    public static let possibleTypes = ["Human"]

    public static let selections: [Selection] = [
      Field("__typename", type: .nonNull(.scalar(String.self))),
      Field("name", type: .nonNull(.scalar(String.self))),
      Field("height", type: .scalar(Double.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String, height: Double? = nil) {
      self.init(snapshot: ["__typename": "Human", "name": name, "height": height])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    /// What this human calls themselves
    public var name: String {
      get {
        return snapshot["name"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    /// Height in the preferred unit, default is meters
    public var height: Double? {
      get {
        return snapshot["height"]! as! Double?
      }
      set {
        snapshot.updateValue(newValue, forKey: "height")
      }
    }
  }
}