
#And I am part of the project "Purificación de Aire en Cercado"
Given('I am part of the project {string}') do |projectName|
    sleep 3
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    enterProjectDetailsFromCategory(projectName)
    if page.has_text?('DEJAR PROYECTO')
        puts("JOINED")
    else
        joinProjectButton = find('button',:text => "UNIRME")
        joinProjectButton.click
    end    
end

#When I click DEJAR PROYECTO
When('I click DEJAR PROYECTO') do
    sleep 3
    leaveProjectButton = find('button',:text => "DEJAR PROYECTO")
    leaveProjectButton.click
end

Then('I should see the button DEJAR PROYECTO replaced by buttton {string}') do |buttonText|
    expect(find('button',:text => "UNIRME"))
end