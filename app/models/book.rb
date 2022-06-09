class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :title, presence: true, length: { minimum: 3 }
  validate :check_title_capital_letter
  # or validates_with CapitalLetterValidator, fields: [:title]

  private

  def check_title_capital_letter
    return if /^[[:upper:]]/.match(title[0]) # or field[0].upcase == field[0]

    errors.add(:title, 'must begin with capital letter')
  end
end
