class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("elephant").to_f
    @square_of_num = @num ** 2
    render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper)

    render({ :template => "calculation_templates/rand_results.html.erb" })
  end

  def blank_sqrt_form
    render({ :template => "calculation_templates/sqrt_form.html.erb" })
  end

  def calculate_sqrt
    @num = params.fetch("user_number").to_i
    @numf = @num.to_f
    @result = @numf * 0.5

    render({ :template => "calculation_templates/sqrt_results.html.erb" })
  end

  def blank_pay_form
    render({ :template => "calculation_templates/pay_form.html.erb" })
  end

  def calculate_pay
    @apr = "%.4f" % params.fetch("apr")
    @years = params.fetch("years").to_i
    @p = params.fetch("principal").to_f
    @principal = format("$%.2f", params.fetch("principal")).gsub(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
    rate = @apr.to_f / 100
    r = rate.to_f / 12
    pv = @p
    n = @years * 12
    num = r.to_f * @p
    den = 1 - (1 + r) ** -n
    @calc = num / den
    @pay = @calc.to_s(:currency)

    render({ :template => "calculation_templates/pay_results.html.erb" })
  end
end
