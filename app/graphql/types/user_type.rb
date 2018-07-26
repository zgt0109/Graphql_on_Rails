Types::UserType = GraphQL::ObjectType.define do
    name 'User'
  
    field :id, !types.ID
    field :name, !types.String
    field :email, !types.String
    field :password_digest, !types.String
    field :created_at, !types.String
    field :updated_at, !types.String
    field :votes, -> {!types[Types::VoteType]}
  end