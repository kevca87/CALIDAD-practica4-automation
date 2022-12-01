When('I click on ELIMINAR') do
    sleep 8
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
    expect(page).not_to have_selector('a.ver-button[name="'+projName+'"]')
end

Then('I should not see the button ELIMINAR') do
    expect(page).not_to have_content('ELIMINAR')
end