# And I click on Proyectos icon
Given('I click on Proyectos icon') do
    sleep 2
    projectsIcon = find_all(:css, 'span.MuiBottomNavigationAction-wrapper')[1]    
    projectsIcon.click
    sleep 3
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
        when "Project name:"
            fill_in 'titulo', :with => value
        when "Description:"
            fill_in 'descripcion', :with => value
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
    @medioAmbienteCategory.click
    sleep 2
    #projectTitles = find_all('div p.MuiTypography-root.content-title.MuiTypography-body1.MuiTypography-gutterBottom')
    projectTitle = find('p', :text => "es el proyecto para probar")
    projectDescription= find('p', :text => "descripción de proyecto para proba")
end

Then('I should not see the button CREAR PROYECTO') do
    page.should_not have_content('CREAR PROYECTO')
    page.should_not have_css('button[name="crearProyecto"]')
end