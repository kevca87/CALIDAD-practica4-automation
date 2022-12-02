def reload_page
    visit current_path
end

#And I am not part of the project "Purificación de Aire en Cercado"
Given('I am not part of the project {string}') do |projectName|
    sleep 3
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = projectName
    enterProjectDetailsFromCategory(projectName)
    if page.has_text?('UNIRME')
        puts("NOT JOINED")
    else
        leaveProjectButton = find('button',:text => "DEJAR PROYECTO")
        leaveProjectButton.click
    end    
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