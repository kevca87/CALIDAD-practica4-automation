def login(email) 
    page.driver.browser.manage.window.maximize
    visit ('/')
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set(email)    
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(ENV['PSW'])    
    login_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')  
    login_button.click
    sleep 5
end

def enterProjectWindowFromHP
    visit ('https://testing-start.web.app/projects/categories')
    sleep 2
end

def enterProjectWindowFromHPAndSelectCategory(categoryName)
    enterProjectWindowFromHP()
    sleep 4
    category = find('h3',:text=>categoryName)
    category.click
    #selectedCategory = find('div.MuiGrid-root.MuiGrid-container.MuiGrid-spacing-xs-4 h3', :text => categoryName)    
    #selectedCategory.click
end

def enterProjectDetailsFromCategory(projectName)
    projectName = 'detalle' + projectName
    puts(projectName)
    projectSeeDetailsLinkButton = find(:css,'a.ver-button[name="'+projectName+'"]')
    puts('verificando')
    projectSeeDetailsLinkButton.click
end

def logout(credentials)
    logoutButton = find('span.MuiChip-label',:text=>credentials)
    logoutButton.click
    logoutButton = find('span',:text=>'LOGOUT')
    logoutButton.click
end

def select_option(css_selector,selectText, value)
    selectDropdown = find(css_selector, visible: false).first(:xpath,".//..").click
    #selectDropdown = find(:css, css_selector+'[aria-hidden="true"]')
    find('li', :text=>value).click
end

def getProjectCategoryElement(projectCategory)
    return find('h3', :text => projectCategory)
end