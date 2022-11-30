def reload_page
    visit current_path
end
# When I click UNIRME
When('I click UNIRME') do
    joinButton = find('button',:text => "UNIRME")
    joinButton.click    
    joinButton.click    
    sleep 1
end

#Then I should see the message "Participacion exitosa"
Then('I should see the message {string}') do |message|
    expect(page).to have_content(message)
    sleep 3
end

#And I should see the button UNIRME replaced by "DEJAR PROYECTO"
Then('I should see the button UNIRME replaced by {string}') do |buttonText|\
    sleep 2
    replacedButton = find(:xpath, '//*[@id="root"]/div[2]/div[1]/div/div/div/div[2]/div[1]/button')    
    expect(replacedButton.text).to eq(buttonText)
end