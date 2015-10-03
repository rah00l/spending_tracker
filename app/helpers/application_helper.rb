module ApplicationHelper

  def account_link(account,duration)
    if account == "All"
      link_to( "All Account", transacts_path(account_id: account, duration: duration) )
    else
      link_to( account.name, transacts_path(account_id: account, duration: duration) )
    end
  end

  def weekly_spendings(account,duration)
    return link_to( "Weekly", transacts_path(account_id: account, duration: duration))
  end

  def monthly_spendings(account,duration)
    return link_to( "Monthly", transacts_path(account_id: account, duration: duration))
  end

  def yearly_spendings(account,duration)
    return link_to( "Yearly", transacts_path(account_id: account, duration: duration))
  end

end
