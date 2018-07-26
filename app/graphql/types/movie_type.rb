Types::MovieType = GraphQL::ObjectType.define do
    name "Movie"

    field :id, !types.ID
    field :title, !types.String
    field :description, !types.String

    field :reviews do
        type types[Types::ReviewType]
        resolve -> (obj, args, ctx) {obj.reviews}
    end
end