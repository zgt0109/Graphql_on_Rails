# class Types::MutationType < Types::BaseObject
#   # TODO: remove me
#   field :test_field, String, null: false,
#     description: "An example field added by the generator"
#   def test_field
#     "Hello World"
#   end
# end


Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  # TODO: Remove me
  # field :testField, types.String do
  #   description "An example field added by the generator"
  #   resolve ->(obj, args, ctx) {
  #     "Hello World!"
  #   }
  # end

  field :createLink, function: Resolvers::CreateLink.new
  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
  field :createVote, function: Resolvers::CreateVote.new
  field :deleteLink, function: Resolvers::DeleteLink.new

  field :createMovie do
    type Types::MovieType
    description "Create Movie"

    argument :title, !types.String
    argument :description, !types.String

    resolve -> (obj, args, ctx) {
      Movie.create(
        title: args[:title],
        description: args[:description]
      )
    }
  end


  field :createReview do
    type Types::ReviewType
    description "Create Review"

    argument :movie_id, !types.ID
    argument :content, !types.String

    resolve -> (obj, args, ctx) {
      Review.create(
        movie_id: args[:movie_id],
        content: args[:content]
      )
    }
  end
end