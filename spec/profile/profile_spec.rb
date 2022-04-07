#require '../profile_helper.rb'
require 'rails_helper.rb'


# Se agrupan todos los tests relacionados al controlador de Profiles, con esta línea se le dice a Rails que será testeado
RSpec.describe "Profiles", type: :request do
    # Se crean unos atributos para la creación de un Profile 
    # para ver si es que funciona bien algunas características en donde se necesita que el usuario sea guardado
    before(:each) {
        @attr_user = {
        :name => "Example_name", 
        :description => 'Exampple description',
        :email => 'test@test.com', 
        :work => 'example work',
        :age => 20
        }
        
        @invalid_attr_user = {
            :name => "Example_name", 
            :description => 'Exampple description',
            :email => 'test@test.com', 
            :work => 'example work',
            :age => 'hola'
        }
        @attr_user2 = {
            :name => "Example_name_2", 
            :description => 'Exampple description',
            :email => 'test@test.com', 
            :work => 'example work',
            :age => 25
        }
    }
    # Se describe lo que se testea
    describe "get index" do
        # Comportamiento esperado
        it "should return a successful request" do
            # Se le señala a Rails que se haga un GET a la ruta /profiles
            get "/profiles"
            # Lo esperado es que la respuesta tenga un status ok o 200 que representa que todo ha salido bien
            expect(response).to have_http_status(:ok)
        end
    end

    describe "get_new" do
        it "should return a successful request" do
            get "/profiles/new"
            expect(response).to have_http_status(:ok)
        end
    end

    describe "get_show" do
        it "should return a successful request" do
            # Se crea una instancia de Profile
            @profile = Profile.create!(@attr_user)
            # Se realiza un GET con el id del profile recién creado y se espra que la salida sea un 200 que es lo mismo que un ok
            get "/profile/#{@profile.id}"
            expect(response).to have_http_status(:ok)
        end
    end

    describe "create" do
        # La idea es que cuando yo cree un usuario la cuenta de usuario totales se incremente en 1
        it "should increase count of Profiles by 1" do
            # Se espera que el bloque de código entregado cambie la cuenta de Profile en 1 (al poner 1 es +1).
            expect {
            post "/profiles", params: {profile: @attr_user}
            }.to change(Profile, :count).by(1)
        end
        # No debería aumentar la cuenta porque le estamos pasando un atributo inválido según las validaciones que se hicieron
        it "shouldn't increase count of Profiles" do
            expect {
            post "/profiles", params: {profile: @invalid_attr_user}
            }.to change(Profile, :count).by(0)
        end
    end

    describe "edit" do
        it "should return a successful request" do
            @profile = Profile.create!(@attr_user)
            get "/profiles/#{@profile.id}/edit"
            expect(response).to have_http_status(:ok)
            
        end
    end

    describe "update" do
        it "should change a Profile" do
            # Se crea el perfil donde se testeará el update
            @profile = Profile.create!(@attr_user)
            
            expect{
            patch "/profile/#{@profile.id}", params: {profile: {:age => 40}}
            # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
            @profile.reload
            # Luego se revisa si cambió alguno de los atributos del usuario
            }.to change(@profile, :attributes)
            
        end
    end

    describe "update" do
        it "shouldn't change a Profile" do
            # Se crea el perfil donde se testeará el update
            @profile = Profile.create!(@attr_user)
            
            expect{
            # Se realiza un patch dado que es de actualización de un usuario ya creado
            patch "/profile/#{@profile.id}", params: {profile: @invalid_attr_user}
            # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
            # Luego se revisa si cambió alguno de los atributos del usuario
            @profile.reload
            }.to_not change(@profile, :attributes)
            
        end
    end


    describe "delete" do
        it "should decrease count of Profiles by 1" do
            # Se crea el perfil donde se testeará el update
            @profile = Profile.create!(@attr_user)
            expect{
            delete "/profile/#{@profile.id}"
            # Se recarga la instancia de profiele nuevamente con los posibles nuevos atributos
            # Luego se revisa si cambió alguno de los atributos del usuario
            @profile.reload
            }.to change(Profile, :count).by(-1)
            
        end
    end

end