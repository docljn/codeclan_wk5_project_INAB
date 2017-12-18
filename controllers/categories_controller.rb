# categories_controller.rb


# index
get("/categories") do
  @categories = Category.select_all()
  erb(:"/categories/index")
end


# new - two steps
get("/categories/new") do
  erb(:"/categories/new")
end

post("/categories") do
  category = Category.new(params)
  category.save
  redirect to("/categories")

end

# categories_controller.rb
