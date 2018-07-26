# class Types::QueryType < Types::BaseObject
#   # Add root-level fields here.
#   # They will be entry points for queries on your schema.

#   # TODO: remove me
#   field :test_field, String, null: false,
#     description: "An example field added by the generator"
#   def test_field
#     "Hello World!"
#   end
# end


Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  # field :allLinks, !types[Types::LinkType] do
  #   # resolve would be called in order to fetch data for that field
  #   resolve -> (obj, args, ctx) { Link.all }
  # end

  field :allUsers, !types[Types::UserType] do
    description "resolve would be called in order to fetch data for that field"
    resolve -> (obj, args, ctx) { User.all }
  end

  field :allLinks, function: Resolvers::LinksSearch



  # field :allMovies, !types[Types::MovieType] do
  #   resolve -> (obj, args, ctx) { Movie.all }
  # end
  
  field :allMovies do
    # type !types[Types::MovieType]
    type !types[Types::MovieType]
    description "A list of all the movies"

    resolve -> (obj, args, ctx) { Movie.all }
  end
  
  field :movie do
    type Types::MovieType
    description "返回电影详情"
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Movie.find(args[:id]) }
  end

  # field :delete_1_link do
  #   type Types::LinkType
  #   description "删除一个LINK"
  #   argument :id, !types.ID
  #   resolve -> (obj, args, ctx) { Link.find(args[:id]).destroy }
  # end

end