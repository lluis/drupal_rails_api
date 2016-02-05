class Event < ApplicationRecord
  self.primary_key = :id

  def date
    self[:date].rfc822
  end

end
