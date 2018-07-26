class Resolvers::DeleteLink < GraphQL::Function
    type Types::LinkType
    description "删除LINK"

    argument :id, !types.ID

    def call(obj,args,ctx)
        @link =  Link.find(args[:id])
        @link.destroy
    rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
end