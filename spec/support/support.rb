module HelperSupport

  attr_reader :path_to_file

  def path_to_file
    File.join(Dir.pwd, "/spec/photos/foto14.jpg")
  end

  def sign_in_user(user, vPassword)
    visit sign_in
    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => vPassword
    click_button("Sign in")
  end

  def picture_attributes
    {
      :title => "Teste",
      :image => File.open(path_to_file),
      :description => %w(Lorem Ipsum is simply dummy text of the printing and typesetting.)
    }
  end

end

