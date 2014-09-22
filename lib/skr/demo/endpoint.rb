# It's a demo - we don't worry about security
# find or create a user with the email and role they wanted
# and then log them in with it
Skr::API::Root.post "demo-user" do
    data = params[:data]
    if data[:name].blank? || data[:email].blank?
        return { success:false, message: "Need name and email for demo" }
    end

    user_id = case data[:role_names].first
              when 'administrator'    then 1
              when 'accounting'       then 2
              when 'customer_support' then 3
              when 'purchasing'       then 4
              end

    session[:user_id] = user_id
    session[:name]  = data[:name]
    session[:email] = data[:email]

    { success: true, data: Skr::User.find(user_id).workspace_data }
end
