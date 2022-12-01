Before '@verifyNotJoinedToProject' do
    selectedCategory = find('div.MuiGrid-root.MuiGrid-container.MuiGrid-spacing-xs-4 h3', :text => "MEDIO AMBIENTE")    
    selectedCategory.click
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    joinButton = find('button',:text => "UNIRME")
    joinButton.click
    projectName = 'detalle' + projectName
    puts(projectName)
    projectSeeDetailsLinkButton = find(:css,'a.ver-button[name="'+projectName+'"]')
    projectSeeDetailsLinkButton.click
    joinLeaveButton = find(:xpath, '//*[@id="34"]/button')
    if(joinLeaveButton.text=="DEJAR PROYECTO")
        joinLeaveButton.click
    end
end

After '@leaveProject' do
    leaveButton = find('button',:text => "DEJAR PROYECTO")
    leaveButton.click
end

Before '@verifyProjectToDeleteExists' do
    page.driver.browser.manage.window.maximize
    visit ('/')
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set("coreteam@gmail.com")    
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(ENV['PSW'])    
    login_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')  
    login_button.click
    sleep 2
    projectsIcon = find_all(:css, 'span.MuiBottomNavigationAction-wrapper')[1]    
    projectsIcon.click
    sleep 2
    medioAmbienteCategory = find('h3',:text=>"MEDIO AMBIENTE")
    medioAmbienteCategory.click
    projectName = 'detalle' + 'Nombre Proyecto Ambiental para borrar'
    if page.has_css?('a.ver-button[name="'+projectName+'"]')
        puts("project found")
    else
        projectsIcon = find_all(:css, 'span.MuiBottomNavigationAction-wrapper')[1]    
        projectsIcon.click
        createProjectButton = find(:css,'button[name="crearProyecto"]')
        createProjectButton.click
        fill_in 'titulo', :with => 'Nombre Proyecto Ambiental para borrar'
        fill_in 'descripcion', :with => 'para borrar'
        createProjectButton = find(:css,'input[name="crearProyecto1"]')
        createProjectButton.click
    end
    logoutButton = find('span.MuiChip-label',:text=>'CT')
    logoutButton.click
    logoutButton = find('span',:text=>'LOGOUT')
    logoutButton.click
end