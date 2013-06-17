include ApplicationHelper

# add 'have_title' test
RSpec::Matchers::define :have_title do |text|
 match do |page|
   Capybara.string(page.body).has_selector?('title', text: text)
 end
end
