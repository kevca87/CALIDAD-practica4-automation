def login(email) 
    page.driver.browser.manage.window.maximize
    visit ('/')
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set(email)    
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(ENV['PSW'])    
    login_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')  
    login_button.click
    sleep 2
end

def enterProjectWindowFromHP
    projectsIcon = find_all(:css, 'span.MuiBottomNavigationAction-wrapper')[1]    
    projectsIcon.click
    sleep 2
end

def enterProjectWindowFromHPAndSelectCategory(categoryName)
    enterProjectWindowFromHP()
    category = find('h3',:text=>categoryName)
    category.click
    #selectedCategory = find('div.MuiGrid-root.MuiGrid-container.MuiGrid-spacing-xs-4 h3', :text => categoryName)    
    #selectedCategory.click
end

def enterProjectDetailsFromCategory(projectName)
    projectName = 'detalle' + projectName
    puts(projectName)
    projectSeeDetailsLinkButton = find(:css,'a.ver-button[name="'+projectName+'"]')
    projectSeeDetailsLinkButton.click
end

def logout(credentials)
    logoutButton = find('span.MuiChip-label',:text=>credentials)
    logoutButton.click
    logoutButton = find('span',:text=>'LOGOUT')
    logoutButton.click
end

Before '@verifyProjectToDeleteExists' do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHP()
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    enterProjectDetailsFromCategory(projectName)
end

def verifyNotJoined(email)
    login(email)
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    enterProjectDetailsFromCategory(projectName)
    if page.has_text?('UNIRME')
        puts("NOT JOINED")
    else
        leaveProjectButton = find('button',:text => "DEJAR PROYECTO")
        leaveProjectButton.click
    end    
end


def verifyJoined(email)
    login(email)
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    enterProjectDetailsFromCategory(projectName)
    if page.has_text?('DEJAR PROYECTO')
        puts("JOINED")
    else
        leaveProjectButton = find('button',:text => "UNIRME")
        leaveProjectButton.click
    end    
end

Before '@verifyNotJoinedToProject' do 
    verifyNotJoined("coreteam@gmail.com")
    verifyNotJoined("voluntario@gmail.com")
    verifyNotJoined("lider@gmail.com")
end

Before "@verifyProjectExists" do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    enterProjectDetailsFromCategory(projectName)
end

Before "@verifyJoinedToProject" do
    verifyJoined("coreteam@gmail.com")
    verifyJoined("voluntario@gmail.com")
    verifyJoined("lider@gmail.com")
end

Before "@verifyProjectToBeCreatedDoesNotExistAlready" do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectNameOriginal = 'Reforestacion del Tunari'
    projectName = 'detalle' + projectNameOriginal
    sleep 2
    if page.has_css?('a.ver-button[name="'+projectName+'"]')
        puts("project found")
        enterProjectDetailsFromCategory(projectNameOriginal)
        sleep 8
        deleteButton = find('button',:text => "ELIMINAR")
        deleteButton.click
        deleteConfirmationButton = find('button[name="eliminarproyecto1"]')
        deleteConfirmationButton.click
    end    
end
