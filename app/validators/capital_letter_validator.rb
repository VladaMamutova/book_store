class CapitalLetterValidator < ActiveModel::Validator
  def validate(record)
    options[:fields].to_a.each do |field|
      value = record.send(field)
      next if value.empty? || /^[[:upper:]]/.match(value) # or field[0].upcase == field[0]

      record.errors.add(field, 'must begin with capital letter')
    end
  end
end
