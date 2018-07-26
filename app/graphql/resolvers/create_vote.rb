class Resolvers::CreateVote < GraphQL::Function
    argument :linkId, types.ID

    type Types::VoteType
    description "创建投票"

    def call(_obj, args, _ctx)
        Vote.create!(
            link: Link.find_by(id: args[:linkId]),
            user: _ctx[:current_user]
        )
    end
end