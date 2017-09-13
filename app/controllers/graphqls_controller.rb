class GraphqlsController < ApplicationController
    before_action :authenticate_user_from_token!
    before_action :authenticate_user!

    def create
        query_string = params[:query]
        query_variables = JSON.load(params[:variables]) || {}
        context = { current_user: current_user }
        result = Schema.execute(query_string, variables: query_variables, context: context)
        render json: result
    end

    private
    def authenticate_user_from_token!
        user_token = params[:user_token].presence
        user = user_token && User.find_by_authentication_token(user_token.to_s)
        
        if user
            sign_in user, store: false
        end
    end

end
