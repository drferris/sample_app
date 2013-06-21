include ApplicationHelper

# add 'have_title' test
RSpec::Matchers::define :have_title do |text|
 match do |page|
   Capybara.string(page.body).has_selector?('title', text: text)
 end
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end
