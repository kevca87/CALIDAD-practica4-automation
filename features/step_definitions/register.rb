def delete_user
    visit('/cuenta')
end

Given('I type {string} in {string}') do |fieldValue, fieldName|
    if fieldName == "Telefono"
		fill_in('phone', :with => fieldValue)
    else
        fill_in(fieldName,:with => fieldValue)
    end
end

When('the button {string} is pressed') do |button|
    register_button = find('button',:text => button)
    register_button.click
end

When('I click outside of the input field') do
    formPaper = find(:css,'body')
    formPaper.click
end

Then('an alert appears with the message {string}') do |alertMessage|
    expect(page).to have_content(alertMessage)
end

Then('I can login with user {string} and password {string} and see my initials {string} in the top right corner.') do |username, password, initials|
    visit('/login')
    fill_in('email', :with => username)
    fill_in('password', :with => password)
    login_button = find(:xpath,'/html/body/div/div[2]/div[1]/div/div[2]/div[2]/div/form/div/button')    
    login_button.click
    expect(page).to have_content(initials)
end