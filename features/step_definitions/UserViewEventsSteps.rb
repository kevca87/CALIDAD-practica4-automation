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
    if page.has_xpath?('//*[@id="scrollable-auto-tabpane-0"]/div/span/div/div[2]/button')
        explore_events_button = find(:xpath,'//*[@id="scrollable-auto-tabpane-0"]/div/span/div/div[2]/button')
        explore_events_button.click
        list_events = page.all('div', class: 'card1')
        events_to_test = Array.new(list_events.size()) { rand(1..list_events.size()) }
        events_to_test = events_to_test.to_set
        events_to_test.each do |i|
            event_to_join_button = find(:css,"#root > div:nth-child(2) > div:nth-child(2) > div > div.container1.container > div.Container-Body > div:nth-child(#{i}) > div > div.CardBody-Eventos.card-body > div > button:nth-child(1)")
            event_to_join_button.click
        end
        profile_button = find(:css,'#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(4)')
        profile_button.click
    else
        puts 'The volunteer has already events registered' 
    end
end

Given('the volunteer has not events joined') do
    if !page.has_xpath?('//*[@id="scrollable-auto-tabpane-0"]/div/span/div/div[2]/button')
        view_all_events_button = find(:css, '#root > div:nth-child(2) > header > div.header-menu > div > button:nth-child(3)')
        view_all_events_button.click
        within(:xpath, '//*[@id="root"]/div[2]/div[1]/div/div[1]/div[2]') do
            while page.has_content?('Dejar de Participar')
                leave_button = page.all('button', text: 'Dejar de Participar')[0]
                leave_button.click
                sleep 2
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
