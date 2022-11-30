#When I click DEJAR PROYECTO
When('I click DEJAR PROYECTO') do
    leaveProjectButton = find(:xpath, '//*[@id="root"]/div[2]/div[1]/div/div/div/div[2]/div[1]/button')    
    leaveProjectButton.click
end

Then('I should see the button DEJAR PROYECTO replaced by buttton {string}') do |buttonText|
    expect(find('button',:text => "UNIRME"))
end