class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def to_s(full: false)
    full ? self.full : self.short
  end

  def short
    if self.middle_name.present?
      self.last_name + ' ' + self.first_name[0] + '.' + self.middle_name[0] + '.'
    else
      self.last_name + ' ' + self.first_name[0] + '.'
    end
  end

  def full
    if self.middle_name.present?
      self.last_name + ' ' + self.first_name + ' ' + self.middle_name
    else
      self.last_name + ' ' + self.first_name
    end
  end
end
