Given("visito la pgina de comandos") do
    visit "/"
    click_button('iniciar')
end

When("ingreso la posicion inicial del auto {string}") do |comandos|
    fill_in('campo_entrada', :with => comandos)
end

When("presiono el boton {string}") do |ejecutar|
    click_button('ejecutar')
end

Then("deberia mostrar la posicion inicial del auto {string}") do |string|
    expect(page.body).to match /#{string}/m
end