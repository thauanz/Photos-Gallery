module HelperSupport

  attr_reader :path_to_file

  def path_to_file
    "/home/thauan/Imagens/curso-ruby.jpg"
  end

  def sign_in_user(user, vPassword)
    visit sign_in
    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => vPassword
    click_button("Sign in")
  end
end

