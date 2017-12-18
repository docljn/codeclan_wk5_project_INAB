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

# delete
post("/categories/:id/delete") do
  # do I not need to generate @category because this is called from a page where @category has already been defined?
  Category.delete_one(params["id"])
  redirect to ("/categories")
end

# categories_controller.rb
