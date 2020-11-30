module UsersHelper
  def calculation_of_age(birth_year)
    return "10歳未満" if Date.today.year.to_i - birth_year < 10
    decades = (Date.today.year.to_i - birth_year) / 10
    if (Date.today.year.to_i - birth_year) % 10 < 5
      return "#{decades}0代前半"
    else
      return "#{decades}0代後半"
    end
  end
end
