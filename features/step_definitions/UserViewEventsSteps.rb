Given('a volunteer logged') do
    page.driver.browser.manage.window.maximize
    visit ('/')
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(2) > div > input').set(ENV['EMAIL_VOLUNTEER'])
    find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > div:nth-child(3) > div > input').set(ENV['PSW'])
    login_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div:nth-child(2) > div.MuiGrid-root.jss13 > div > form > div > button')  
    login_button.click
    sleep 5
end

Given('in the account view') do
    profile_button = find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(4)')
    profile_button.click
    sleep 5  
end

Given('the volunteer has one or many events joined') do
    if page.has_content?('Explorar Eventos')
        explore_events_button = find(:css,'#scrollable-auto-tabpane-0 > div > span > div > div.jss42 > button')
        explore_events_button.click
        event1_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div.Container-Body > div:nth-child(4) > div > div.CardBody-Eventos.card-body > div > button:nth-child(1)')
        event2_button = find(:css,'#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div.Container-Body > div:nth-child(3) > div > div.CardBody-Eventos.card-body > div > button:nth-child(1)')
        event1_button.click
        event2_button.click
        profile_button = find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(4)')
        profile_button.click
    else
        puts 'The volunteer has already events registered' 
    end
end

Given('the volunteer has not events joined') do
    if !page.has_content?('Exploarar Eventos')
        view_all_events_button = find(:css, '#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)')
        view_all_events_button.click
        within(:xpath, '//*[@id="root"]/div[2]/div[1]/div/div[1]/div[2]') do
            while page.has_content?('Dejar de Participar')
                page.all('button', text: 'Dejar de Participar').each do |buttons_leave_event|
                    buttons_leave_event.click
                    sleep 3
                end
            end
        end
        profile_button = find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(4)')
        profile_button.click
    else
        puts 'The volunteer has already no events'
    end
end

When("i click in the {string} tab") do |nameTab|
    if nameTab == "TUS EVENTOS"
        your_events_tab = find(:css, '#scrollable-auto-tab-0')
    elsif nameTab == "TUS PROYECTOS"
        your_events_tab = find(:css, '#scrollable-auto-tab-1')
    elsif nameTab == "TUS LOGROS"
        your_events_tab = find(:css, '#scrollable-auto-tab-2')
    end
    your_events_tab.click
end

Then('i should be able to watch a list of the diferent events which i joined') do
    within(:css, '#scrollable-auto-tabpane-0 > div') do
        page.has_css?('MuiPaper-root MuiCard-root jss45 MuiPaper-outlined MuiPaper-rounded')
    end
end 

Then('i should see the message {string}') do |message|
    page.should have_content(message)
end

Then('i should see a button {string}') do |buttonName|
    page.should have_content(buttonName)
end
