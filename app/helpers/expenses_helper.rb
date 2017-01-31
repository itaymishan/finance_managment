module ExpensesHelper
  def expenses_by_category
    @expenses.group_by{|i| i.category.hebrew_name}.map{|k,v| [k, v.map{|item| item.currency.convert_to(params[:filter][:currency], item.amount) }.sum.to_i]}.sort_by{|item| -item[1]}
  end
end
