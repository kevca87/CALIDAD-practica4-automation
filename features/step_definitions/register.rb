Given('I type {string} in {string}') do |fieldValue, fieldName|
    if fieldName == "Telefono"
		fill_in('phone', :with => fieldValue)
    else
        fill_in(fieldName,:with => fieldValue)
    end
end

When('the button {string} is pressed') do |button|
    register_button = find('button',:text => button)
    # register_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div > div.MuiGrid-root > div.MuiPaper-root.MuiCard-root.jss14.MuiPaper-elevation1.MuiPaper-rounded > form > div.jss15 > button')
    register_button.click
end

When('I click outside of the input field') do
    formPaper = find(:css,'body')
    formPaper.click
end

Then('an alert appears with the message {string}') do |alertMessage|
    expect(page).to have_content(alertMessage)
end