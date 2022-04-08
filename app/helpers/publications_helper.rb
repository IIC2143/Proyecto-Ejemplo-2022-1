# frozen_string_literal: true

# Publications Helper
module PublicationsHelper

    # la primera letra del titulo será mayuscula
    def first_letter(act_title)
        upper_title = act_title.capitalize
        return (upper_title == act_title)
    end

end
