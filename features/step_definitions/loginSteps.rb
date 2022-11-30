Before do
	page.driver.browser.manage.window.maximize
    visit ('/')
end

#Given I have entered "<email>" as email and my password
Given('I have entered {string} as email and my password') do |userEmail|
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set(userEmail)    
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(ENV['PSW'])    
end

#When I press INICIAR SESIÓN
When('I press INICIAR SESIÓN') do
    login_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')  
    login_button.click
end

#Then I should see the tab icons
Then('I should see the tab icons') do
    page.should have_css('#root > div:nth-child(2) > header > div.header-menu > div')
end

#And I should see my credentials "<credentials>"
Then('I should see my credentials {string}') do |credentials|
    expect(page).to have_content(credentials)
end

#Given I have entered "<email>" as email and an invalid password
Given('I have entered {string} as email and an invalid password') do |userEmail|
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set(userEmail)    
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(ENV['INV_PSW'])    
end

#Then I should view the message "Correo o contraseña inválidos."
Then('I should view the message {string}') do |errorMessage|
    expect(page).to have_content(errorMessage)
end