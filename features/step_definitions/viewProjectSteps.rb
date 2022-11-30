
#And I click on "MEDIO AMBIENTE" category
Given('I click on {string} category') do |projectCategory|
    selectedCategory = find('div.MuiGrid-root.MuiGrid-container.MuiGrid-spacing-xs-4 h3', :text => projectCategory)    
    selectedCategory.click
    sleep 2
end

#When I click on the project "Nombre Proyecto Ambiental" ver detalles button
When('I click on the project {string} ver detalles button') do |projectName|
    projectName = 'detalle' + projectName
    puts(projectName)
    projectSeeDetailsLinkButton = find(:css,'a.ver-button[name="'+projectName+'"]')
    projectSeeDetailsLinkButton.click
end

#Then I should see "Nombre Proyecto Ambiental" as title of the project
Then('I should see {string} as title of the project') do |projectTitle|
    expect(page.find('h1')).to have_content(projectTitle)
end

#And the following information should be displayed:
Then('the following information should be displayed:') do |table|
    data = table.rows_hash
    data.each_pair do |key,value|
    case key
        when "Fecha de Inicio:"
            fechaDeInicio = page.find('p>b',:text => "Fecha de Inicio:").first(:xpath,".//..")
            expect(fechaDeInicio).to have_content(value)
        when "Fecha de Fin:"
            expect(page.find('p>b',:text => "Fecha de Fin:").first(:xpath,".//..")).to have_content(value)
        when "Descripción:"
            expect(page.find('p>b',:text => "Descripción:").first(:xpath,".//..")).to have_content(value)
        when "Objetivo:"
            expect(page.find('p>b',:text => "Objetivo:").first(:xpath,".//..")).to have_content(value)
        when "Líder:"
            expect(page.find('p>b',:text => "Líder:").first(:xpath,".//..")).to have_content(value)
        when "Categoría:"
            expect(page.find('p>b',:text => "Categoría:").parfirstent).to have_content(value)
        end
    end
end