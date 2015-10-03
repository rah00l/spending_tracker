module TransactsHelper

  def format_number_to_currency(number, html=true)
    # txt = html ? content_tag(:span, '', class: 'rupee') : 'Rs.'
    " #{number.to_s.gsub(/(\d+?)(?=(\d\d)+(\d)(?!\d))(\.\d+)?/, "\\1,")}"
  end

  def currency_color(type)
    type.eql?('Income') ? 'income_amount' : 'expense_amount'
  end

  def get_duration_info(duration)
    case duration
    when "Weekly"
      weekly_duration
    when "Monthly"
      monthly_duration
    when "Yearly"
      yearly_duration
    else
      monthly_duration
    end
  end

  def get_account_id
    account_id = params[:account_id].nil? ? Account.first.id : params[:account_id].to_i
  end

  def weekly_duration
    start_date = Date.today.at_beginning_of_week.day
    end_date = Date.today.at_end_of_week.day
    return "#{start_date} - #{end_date}"
  end

  def monthly_duration
    return Date.today.strftime("%B")
  end

  def yearly_duration
    return Date.today.strftime("%Y")
  end

end
