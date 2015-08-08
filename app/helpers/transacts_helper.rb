module TransactsHelper

  def format_number_to_currency(number, html=true)
  	# txt = html ? content_tag(:span, '', class: 'rupee') : 'Rs.'
    " #{number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")}"
  end

  def currency_color(type)
  	type.eql?('Income') ? 'income_amount' : 'expense_amount'
  end
end
