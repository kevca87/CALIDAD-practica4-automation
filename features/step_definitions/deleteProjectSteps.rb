def reload_page()
    session.driver.browser.navigate.refresh
end
When('I click on ELIMINAR') do
    sleep 15
    hasDeleteButton=false
    while(hasDeleteButton==false)
        puts("no delete button")
        if page.has_css?('button[name="eliminarproyecto"]')
            hasDeleteButton=true
        else
            reload_page()
            sleep 20
        end
    end
    deleteButton = find('button',:text => "ELIMINAR")
    deleteButton.click
end

When('I click on ELIMINAR confirmation message') do
    deleteConfirmationButton = find('button[name="eliminarproyecto1"]')
    deleteConfirmationButton.click
end

Then('I should see validate the project is deleted') do
    medioAmbienteCategory = find('h3',:text=>"MEDIO AMBIENTE")
    medioAmbienteCategory.click
    projName = 'detalle' + @projectName
    puts("project name deleted  = "+projName)
    expect(page).not_to have_selector('a.ver-button[name="'+projName+'"]')
end

Then('I should not see the button ELIMINAR') do
    expect(page).not_to have_content('ELIMINAR')
end