def set_user
  session[:user_id] = Fabricate(:user).id
end

def user
  User.find(session[:user_id])
end

def sign_in(user=nil)
  user ||= Fabricate(:user)
  visit sign_in_path
  fill_in "Email address", with: user.email
  fill_in "Password", with: user.password
  click_on "Sign in"
end
