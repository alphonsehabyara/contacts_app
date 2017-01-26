class Contact < ApplicationRecord

  def friendly_created_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def friendly_updated_at
    updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end

end
