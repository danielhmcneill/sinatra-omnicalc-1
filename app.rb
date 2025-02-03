require "sinatra"
require "sinatra/reloader"

def to_s_percentage(amount)
  "%.4f%%" % (amount)  # Format to four decimal places and append %
end


get("/howdy") do
 erb(:hello)

end

get("/goodbye") do
  erb(:goodbye)

end

get("/square/new") do
  erb(:new_square_calc)

end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2
  
  erb(:square_results)

end

get("/square_root/new") do
  erb(:square_root_calc)

end

get("/square_root/results") do
  @the_num_root = params.fetch("users_number").to_f

  @the_result_root = Math.sqrt(@the_num_root)
  
  erb(:square_root_results)

end

get("/payment/new") do
  erb(:payment_calc)

end

get("/payment/results") do
  @the_num_apr = params.fetch("apr").to_f
  @the_num_years = params.fetch("years").to_i
  @the_num_principal = params.fetch("principal").to_f
  @the_num_apr_math = @the_num_apr/ 100 / 12

  @numerator = (@the_num_apr_math) * (@the_num_principal)
  @denominator = (1-(1+@the_num_apr_math)**(-@the_num_years*12))

  @the_result_payment = (@numerator / @denominator).round(2)

  @percent_apr = to_s_percentage(@the_num_apr)
  erb(:payment_results)

end

get("/random/new") do
  erb(:random_calc)

end

get("/random/results") do
  @the_maximum = params.fetch("max").to_f
  @the_minimum = params.fetch("min").to_f
  @random_number = rand(@the_minimum..@the_maximum)
  
  erb(:random_results)

end



get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
