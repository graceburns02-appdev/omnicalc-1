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
    @num = params.fetch("user_number")

    @result = (@num.to_f ** 0.5)

    render({ :template => "calculation_templates/sqrt_results.html.erb" })
  end

  def blank_pay_form
    render({ :template => "calculation_templates/pay_form.html.erb" })
  end

  def calculate_pay
    @apr_raw = params.fetch("apr").to_f
    @apr = @apr_raw.to_s(:percentage, { :precision => 4 })
    @years = params.fetch("years").to_i
    @p = params.fetch("principal").to_f
    @principal = @p.to_s(:currency)
    rate = @apr.to_f / 100
    r = rate.to_f / 12
    pv = @principal
    n = @years * 12
    num = r.to_f * @p
    den = 1 - (1 + r) ** -n
    @calc = num / den
    @pay = @calc.to_s(:currency)

    render({ :template => "calculation_templates/pay_results.html.erb" })
  end
end
