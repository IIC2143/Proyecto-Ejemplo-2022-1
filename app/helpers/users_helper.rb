# frozen_string_literal: true

# Users Helper
module UsersHelper
    # este helper verifica que el mail ingresado por
    # el usuario tenga un '@'
    def arroba_in_mail(mail)
        mail.include?('@')
    end

    # este helper verifica que la edad ingresada por el 
    # usuario es un numero entero
    def age_is_int(age)
        age_class = age.class
        age_class == Integer        
    end
end
