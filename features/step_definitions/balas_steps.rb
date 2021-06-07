Given('visito la pagina de comandos') do
    visit "/"
    click_button('iniciar')
end
When('ingreso el campo de entrada {string}') do |comandos|
    fill_in('campo_entrada', :with => comandos)
end
  
Then('deberia mostrar el numero de balas del auto {string}') do |stringBalas|
    expect(page.body).to match /#{stringBalas}/m
end

Then("deberia mostrar La posicion final del auto {string}") do |stringPosFin|
    expect(page.body).to match /#{stringPosFin}/m
end