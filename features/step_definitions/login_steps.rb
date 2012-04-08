Given /^I have not ever logged in$/ do
    @user = nil
end

Given /^my mobile number is blank$/ do
  @my_number = ""
end

@omniauth
When /^I log in with Facebook$/ do
  visit "/users/auth/facebook"
end

Then /^I should be prompted for my mobile number$/ do
  page.should have_content "Please enter your mobile number"
end

@omniauth
Given /^I have logged in before$/ do
  @user = User.find_or_create_from_facebook FACEBOOK_AUTH_HASH
end

@omniauth
Given /^I am logged in$/ do
  step %q(I have logged in before)
  step %q(I log in with Facebook)
end



Given /^my mobile number is set$/ do
  @user.mobile_number = "4085559595"
  @user.save!
end

Then /^I should be taken to the homepage$/ do
  page.should have_content "Save Your money for Keggers"
end

