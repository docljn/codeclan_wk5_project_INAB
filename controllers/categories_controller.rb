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


# edit - two steps
get("/categories/:id/edit") do
  @category = Category.select_one(params["id"])
  erb(:"/categories/edit")

end

post("/categories/:id") do
  category = Category.new(params)
  category.save()
  redirect to ("/categories")

end

# categories_controller.rb
