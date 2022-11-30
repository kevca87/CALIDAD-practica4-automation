Before do
	page.driver.browser.manage.window.maximize
    visit ('/')
end

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

Before '@register' do
    register_link = find(:css,'[href="/register"]')
    register_link.click()
end