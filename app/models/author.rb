class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def to_s(full: false)
    full ? full_name : "#{last_name} #{initials}"
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def initials
    "#{first_name[0]}." + (middle_name.present? ? " #{middle_name[0]}." : '')
  end
end
