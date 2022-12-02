# CALIDAD-practica4-automation
 #### INTEGRANTES DE GRUPO:
    * Kevin Céspedes
    * Diego Quiñones
    * Tiara Rojas

## ACERCA DE
Este es un repositorio de Automatización de pruebas SMOKE para la aplicación: https://testing-start.web.app/
![image](https://user-images.githubusercontent.com/74866417/205360759-b394786d-2416-41db-a8ea-26c968ce44d7.png)

## EJECUCIÓN DE PRUEBAS
Para poder correr las pruebas, se requiere configurar el ambiente, para lo cual debe tener instalado Capybara, Ruby y el navegador Google Chrome
  ### INSTALACIÓN
  1. Instalar Ruby + Devkit (rubyinstaller-devkit-...exe) 
      - Enlace para descarga: https://rubyinstaller.org/downloads/
          ![image](https://user-images.githubusercontent.com/74866417/205362523-9c9608a6-8f10-45c7-a57f-8f75955d1d73.png)
          
      - Instalación normal:
          * Aceptar la licencia
            ![image](https://user-images.githubusercontent.com/74866417/205361811-38f886d4-414c-45b3-89c0-c23a22113b58.png)

          * Seleccionar documentación opcionalmente
          ![image](https://user-images.githubusercontent.com/74866417/205362118-18170b7b-af05-4b15-9277-0a697b472e24.png)

          * NEXT, INSTALAR
          
  2. Agregar Ruby al PATH
      - Correr el comando ruby -v en consola
        * En caso de que el comando no sea reconocido, se debe agregar Ruby al PATH y volver a correr el comando
        
  3. Instalar las gemas de Ruby corriendo los siguientes comandos:
        * gem installer cucumber
        * gem installer capybara
        * gem installer selenium-driver
        * gem installer selenium
        * gem installer rspec
        * gem installer capybara-screenshot
      - Verificar que no existan errores en consola al ejecutar los comandos
      
  4. Instalar el driver para Chrome según la versión de Chrome que se tenga instalada
      - Enlace de descarga: https://chromedriver.chromium.org/downloads 
      * Para ver la versión de Chrome instalada, desde el navegador Chrome ingresar a Settings->Acerca de Chrome
      ![image](https://user-images.githubusercontent.com/74866417/205363329-683dde21-9559-4b18-8fec-37b9b1d8ede9.png)
      
  5. Copiar el driver instalado 
    - Extraer el archivo zip que se descargó para instalar el driver para Chrome, abrirlo y copiar el archivo chromedriver.exe al directorio bin de Ruby
  
  ### CLONAR EL REPOSITORIO:
  - Para poder correr las pruebas, lo primero que se debe hacer es clonar el repositorio
  - Ingresar al directorio CALIDAD-practica4-automation
  - Abrir una terminal desde ese directorio
  - Ejecutar los comandos: 
      * cucumber features\login.feature
            para ejecutar las pruebas de login
      * cucumber features\createProject.feature
             para ejecutar las pruebas para crear un proyecto
      * cucumber features\deleteProject.feature
             para ejecutar las pruebas para eliminar un proyecto
      * cucumber features\joinProject.feature
             para ejecutar las pruebas para unirse a un proyecto
      * cucumber features\leaveProject.feature
             para ejecutar las pruebas para dejar un proyecto
      * cucumber features\viewProject.feature
             para ejecutar las pruebas para ver un proyecto
      * cucumber features\register.feature
             para ejecutar las pruebas para registrarse
      * cucumber features\UserEditProfileData.feature
             para ejecutar las pruebas para editar datos de perfil de un usuario
      * cucumber features\UserViewEvents.feature
             para ejecutar las pruebas para ver eventos desde un usuario
      * cucumber features\UserViewProjects.feature
             para ejecutar las pruebas para ver proyectos desde un usuario 
             
      ** Es importante contar con buena conexión a Internet ya que las pruebas podrían fallar en caso contrario
      
      
