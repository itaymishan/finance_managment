module DashboardHelper
  def expenses_by_category
    bar_chart @expenses.group_by{|i| i.category.hebrew_name}.map{|k,v| [k, v.map{|item| item.currency.convert_to(params[:filter][:currency], item.amount) }.sum.to_i]}.sort_by{|item| -item[1]}, height: "400px", library: {
      title: {text: 'Sporters by age', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Ages count'
         }
      },
      xAxis: {
         title: {
             text: 'Age'
         }
      }
    }
  end

  def incomes_by_source
    bar_chart @incomes.group_by{|i| i.income_source.name}.map{|k,v| [k, v.map{|item| item.currency.convert_to(params[:filter][:currency], item.amount) }.sum.to_i]}, height: "400px", library: {
      title: {text: 'Sporters by age', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Ages count'
         }
      },
      xAxis: {
         title: {
             text: 'Age'
         }
      }
    }
  end

  def expenses_by_category_line
    line_chart @expenses.map{|ex| ex.category.hebrew_name}.uniq.map{|c| { name: c, data: @expenses.select{|ex| ex.category.hebrew_name == c }.group_by{|item| item.date }.map{|k,v| [k, v.map{|item| item.currency.convert_to(params[:filter][:currency], item.amount) }.sum.to_i]}}}, min: 0, max: 10000, width: "2000px", height: "400px", library: {
      title: {text: 'Competitions by year', x: -20},
      yAxis: {
          crosshair: true,
          title: {
              text: 'Amount'
          }
      },
      xAxis: {
          crosshair: true,
          title: {
              text: 'Time'
          }
      },
      tooltip: {
        valueSuffix: 'click(s)'
      },
      credits: {
        enabled: false
      }
    }
  end

  def incomes_expenses_line
    input = []
    expenses = {
      name: 'Expense',
      data: @expenses.group_by{|item| item.date }.map{|k,v| [k, v.map{|item| item.currency.convert_to(params[:filter][:currency], item.amount) }.sum.to_i]}
    }
    incomes = {
      name: 'Income',
      data: @incomes.group_by{|item| item.date }.map{|k,v| [k, v.map{|item| item.currency.convert_to(params[:filter][:currency], item.amount) }.sum.to_i]}
    }
    input.push(incomes)
    input.push(expenses)
    line_chart(input, min: 0, max: 100000)
  end


end
