module ApplicationHelper
  def group_total(group)
    total = 0
    return total unless group.expenses.empty?

    expenses = group.expenses
    expenses.each do |ex|
      total += ex.amount
    end
    total
  end
end
