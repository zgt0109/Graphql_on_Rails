# class Resolvers::CreateLink < GraphQL::Function
#     # arguments passed as "args"
#     argument :description, !types.String
#     argument :url, !types.String
  
#     # return type from the mutation
#     type Types::LinkType
  
#     # the mutation method
#     # _obj - is parent object, which in this case is nil
#     # args - are the arguments passed
#     # _ctx - is the GraphQL context (which would be discussed later)
#     def call(_obj, args, _ctx)
#       Link.create!(
#         description: args[:description],
#         url: args[:url],
#       )
#     end
#   end

class Resolvers::CreateLink < GraphQL::Function
    argument :description, !types.String
    argument :url, !types.String

    type Types::LinkType
    description "创建LINK"

    def call(_obj,args,ctx)
        Link.create!(
            description: args[:description],
            url: args[:url],
            user: ctx[:current_user]
        )        
    rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
end