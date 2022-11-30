def reload_page
    visit current_path
end
# When I click UNIRME
When('I click UNIRME') do
    joinButton = find('button',:text => "UNIRME")
    joinButton.click      
end

#Then I should see the message "Participacion exitosa"
Then('I should see the message {string}') do |message|
    expect(page).to have_content(message)
end

#And I should see the button UNIRME replaced by "DEJAR PROYECTO"
Then('I should see the button UNIRME replaced by {string}') do |buttonText|\
    expect(find('button',:text => buttonText))
end