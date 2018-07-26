# class GraphqlTutorialSchema < GraphQL::Schema
#   mutation(Types::MutationType)
#   query(Types::QueryType)
# end



GraphqlTutorialSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  mutation(Types::MutationType)
end