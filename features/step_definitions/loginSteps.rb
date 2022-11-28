Before do
	page.driver.browser.manage.window.maximize
    visit ('/')
end

Given('I have entered {string} as email') do |userEmail|   
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set(userEmail)    
end
  
Given('I have entered {string} as password') do |userPassword|
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(userPassword)    
end

When('I press login') do
    login_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')  
    login_button.click
end

Then('I should see the Start Americas Together image') do
    page.should have_css('#root > div:nth-child(2) > header > div.header-logo > div.jss4 > img')
end
  
Then('I should see tab icons') do
   page.should have_css('#root > div:nth-child(2) > header > div.header-menu > div')
end
  
Then('I should see my name') do
   expect(page).to have_content("VV")
end

Then('I should view an error message') do
    expect(page).to have_content("Correo o contraseña inválidos.")
end