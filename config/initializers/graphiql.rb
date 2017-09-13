GraphiQL::Rails.config.headers['Authorization'] = -> (context) {
    # "Token #{context.request.env[:devise].current_user.try(:api_token)}"
    puts context.request.env.inspect.to_json
    "Token bob"#{}"
}