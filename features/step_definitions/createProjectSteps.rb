# And I click on Proyectos icon
Given('I click on Proyectos icon') do
    visit ('https://testing-start.web.app/projects/categories')
    sleep 5
end

# When I click CREAR PROYECTO
When('I click CREAR PROYECTO') do
    createProjectButton = find(:css,'button[name="crearProyecto"]')
    createProjectButton.click
end

#And I enter the required fields as shown below
When('I enter the required fields as shown below') do |table|
    data = table.rows_hash
    data.each_pair do |key,value|
    case key
        when "Nombre del Proyecto:"
            fill_in 'titulo', :with => value
            @projectTitle = value
        when "Descripción:"
            fill_in 'descripcion', :with => value
            @projectDescription = value
        when "Fecha de Inicio:"
            fill_in 'fecha_inicio', :with => value
        when "Fecha de Fin:"
            fill_in 'fecha_fin', :with => value
        when "Objetivo:"
            fill_in 'objetivo', :with => value
        when "Lideres:"
            select_option('body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div:nth-child(11) > div > div > div > input', 'KEVIN DIEGO', value)
        when "Categorias:"
            select_option('body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div:nth-child(12) > div > div > div > input', 'Medio Ambiente', value)
        when "Estados:"
            select_option('body > div:nth-child(6) > div.paper-crear > form > div:nth-child(3) > div:nth-child(13) > div > div > div > input', 'EN CURSO', value)     
        end
    end
end

# And I click CREAR PROYECTO button in the form
When('I click CREAR PROYECTO button in the form') do
    createProjectButton = find(:css,'input[name="crearProyecto1"]')
    createProjectButton.click
end

#Then I should see the list of project categories
Then('I should see the list of project categories') do
    categories = find_all(:css, 'div.MuiGrid-root.MuiGrid-container.MuiGrid-spacing-xs-4 h3')
    if(categories.length == 8)        
        if(categories[0].text=="MEDIO AMBIENTE" && categories[1].text=="DESARROLLO SOSTENIBLE" && categories[2].text == "TRABAJO SOCIAL" && categories[3].text=="EMPODERAMIENTO" && categories[4].text=="ANIMALES" && categories[5].text=="COMUNIDAD" && categories[6].text=="EDUCACIÓN" && categories[7].text == "OTROS")
            puts("CORRECT CATEGORIES")
        else 
            raise "Categories not displayed correctly"
        end
        @medioAmbienteCategory = categories[0]
    else
        raise "Incorrect categories"  
    end      
end

#And validate the project exists
Then('validate the project exists') do
    sleep 2
    @medioAmbienteCategory.click
    puts("validate")
    sleep 6
    #projectTitles = find_all('div p.MuiTypography-root.content-title.MuiTypography-body1.MuiTypography-gutterBottom')
    projectTitle = find('p', :text => @projectTitle)
    projectDescription= find('p', :text => @projectDescription)
end

#And validate the project exists in category "ANIMALES"
Then('validate the project exists in category {string}') do |projectCategory|
    sleep 2
    categoryElement = getProjectCategoryElement(projectCategory)
    categoryElement.click
    puts("validate")
    sleep 6
    #projectTitles = find_all('div p.MuiTypography-root.content-title.MuiTypography-body1.MuiTypography-gutterBottom')
    projectTitle = find('p', :text => @projectTitle)
    projectDescription= find('p', :text => @projectDescription)
end

Then('I should not see the button CREAR PROYECTO') do
    expect(page).not_to have_content('CREAR PROYECTO')
    expect(page).not_to have_css('button[name="crearProyecto"]')
end

#Then I should see the message "Error: Campo required" in both fields
Then('Then I should see the message {string} in both fields') do |errorMessage|
    expect(find('input[name="titulo"] + p', :text => errorMessage))
    expect(find('input[name="descripcion"] + p', :text => errorMessage))
end