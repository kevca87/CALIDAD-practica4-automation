
Before '@verifyProjectToDeleteExists' do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHP()
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    enterProjectDetailsFromCategory(projectName)
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

Before '@verifyProjectToDeleteExists' do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'detalle' + 'Limpiando el Río Rocha'
    puts("proj name")
    if page.has_css?('a.ver-button[name="'+projectName+'"]')
        puts("project found")
    else
        puts("else")
        enterProjectWindowFromHP()
        sleep 5
        createProjectButton = find(:css,'button[name="crearProyecto"]')
        createProjectButton.click
        fill_in 'titulo', :with => 'Limpiando el Río Rocha'
        fill_in 'descripcion', :with => 'para borrar'
        createProjectButton = find(:css,'input[name="crearProyecto1"]')
        createProjectButton.click
    end    
end

Before '@createDeletedProject' do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'detalle' + 'Limpiando el Río Rocha'
    puts("proj name")
    if page.has_css?('a.ver-button[name="'+projectName+'"]')  
        puts("exists already")  
    else
        enterProjectWindowFromHP()
        createProjectButton = find(:css,'button[name="crearProyecto"]')
        createProjectButton.click
        fill_in 'titulo', :with => 'Limpiando el Río Rocha'
        fill_in 'descripcion', :with => 'para borrar'
        createProjectButton = find(:css,'input[name="crearProyecto1"]')
        createProjectButton.click
    end
end

Before '@deleteCreatedProject' do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectNameOriginal = 'Reforestacion del Tunari'
    projectName = 'detalle' + projectNameOriginal
    sleep 2
    if page.has_css?('a.ver-button[name="'+projectName+'"]')  
        puts("deleting...")
        enterProjectDetailsFromCategory(projectNameOriginal)    
        sleep 10
        deleteButton = find('button',:text => "ELIMINAR")
        deleteButton.click
        deleteConfirmationButton = find('button[name="eliminarproyecto1"]')
        deleteConfirmationButton.click 
    else          
        puts("is already deleted")
    end
    logout("CT")
end

Before '@verifyProjectExists' do
    login("coreteam@gmail.com")       
    enterProjectWindowFromHP()
    enterProjectWindowFromHPAndSelectCategory("MEDIO AMBIENTE")
    sleep 2
    projectName = 'Nombre Proyecto Ambiental'
    if page.has_css?('a.ver-button[name="'+projectName+'"]')
        puts("project found")
    else
        visit('/projects/categories')
        createProjectButton = find(:css,'button[name="crearProyecto"]')
        createProjectButton.click
        fill_in 'titulo', :with => 'Nombre Proyecto Ambiental'
        fill_in 'descripcion', :with => 'descripción Nombre Proyecto Ambiental'
        fill_in 'fecha_inicio', :with => '2022-11-29'
        fill_in 'fecha_fin', :with => '2022-12-27'        
        createProjectButton = find(:css,'input[name="crearProyecto1"]')
        createProjectButton.click
    end    
end