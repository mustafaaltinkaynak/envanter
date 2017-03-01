module ApplicationHelper
  def currency_convert(price)
    number_to_currency(price, locale: :tr)
  end
end
