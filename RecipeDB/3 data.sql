--AS Nice data!! 100%
use RecipeDB
go 

delete CookbookRecipe
delete Cookbook
delete RecipeMealCourse
delete MealCourse
delete Course
delete Meal
delete RecipeStep
delete RecipeIngredient
delete Recipe
delete Ingredient
delete Cuisine
delete MeasurementType
delete Users

insert Users(UserFirstName, UserLastName, UserPassword)
      select 'Susie', 'Fishbein', 'SusFish6576!'
union select 'Victoria', 'Dweck', 'DweckVicy01'
union select 'Miriam', 'Pascal', 'MPK2020'
union select 'Chanie', 'Nayman', 'Chan613'
union select 'Libby', 'Gold', 'gl1000'
union select 'Pessi', 'Grun', 'Pg@1648'
union select 'Malky', 'Freidman', 'Malks69'
union select 'Malky', 'Freidman', 'Mf360'

insert MeasurementType(MeasurementTypeName)
      select 'tsp'
union select 'tbsp'
union select 'cup'
union select 'cups'
union select 'oz'
union select 'lb'
union select 'can'
union select 'package'
union select 'packages'
union select 'bag'
union select 'jar'
union select 'bar'
union select 'small'
union select 'medium'
union select 'large'
union select 'extra-large'
union select 'pinch'
union select 'dash'
union select 'sprinkle'
union select 'to taste'
union select 'regular'
union select 'squares'
union select 'stalks'
union select 'slices'
union select 'cloves'
union select 'as necessary'
union select 'capful'
union select 'stick'

insert Cuisine(CuisineName)
      select 'American'
union select 'British'
union select 'Chinese'
union select 'French'
union select 'Greek'
union select 'Indian'
union select 'Italian'
union select 'Moroccan'
union select 'Israeli'
union select 'Russian'
union select 'Mediterranean'
union select 'Zero Calorie'

insert Ingredient(IngredientName)
      select 'eggs'
union select 'egg'
union select 'sugar'
union select 'oil'
union select 'flour'
union select 'salt'
union select 'water'
union select 'baking soda'
union select 'baking powder'
union select 'brown sugar'
union select 'corn starch'
union select 'corn syrup'
union select 'confectionary sugar'
union select 'cocoa'
union select 'vanilla extract'
union select 'vanilla sugar'
union select 'coffee'
union select 'chocolate chips'
union select 'yeast'
union select 'whip cream'
union select 'milk'
union select 'heavy cream'
union select 'cinnamon'
union select 'butter'
union select 'margarine'
union select 'strawberries'
union select 'blueberries'
union select 'cranberries'
union select 'chicken'
union select 'minute steak'
union select 'honey'
union select 'onion powder'
union select 'garlic powder'
union select 'paprika'
union select 'black pepper'
union select 'potatoes'
union select 'onions'
union select 'butternut squash'
union select 'zucchini'
union select 'sweet potato'
union select 'sweet potatoes'
union select 'parmesan cheese'
union select 'shredded cheese'
union select 'cottage cheese'
union select 'cream cheese'
union select 'sour cream'
union select 'pasta sauce'
union select 'vodka sauce'
union select 'ketchup'
union select 'mustard'
union select 'vinager'
union select 'carrots'
union select 'franks'
union select 'red currant jelly'
union select 'spicy brown mustard'
union select 'puff pastry squares'
union select 'portobello mushroom'
union select 'sesame seeds'
union select 'minced garlic'
union select 'basil'
union select 'thyme'
union select 'salt and pepper'
union select 'celery'
union select 'shredded cabbage'
union select 'marjoram'
union select 'cumin'
union select 'bread'
union select 'pineapple juice'
union select 'crushed pineapple'
union select 'pina colada syrup'
union select 'kiwi'
union select 'noodles'
union select 'applesauce'
union select 'olive oil'
union select 'orzo'
union select 'soy sauce'
union select 'crushed red pepper'
union select 'garlic'
union select 'chicken cutlets'
union select 'apricot jam'
union select 'mayonnaise'
union select 'honey'
union select 'lemon juice'
union select 'onion soup mix'
union select 'bread crumbs'
union select 'pickled tongue'
union select 'tomatoe sauce'
union select 'orange juice'
union select 'corned beef'
union select 'ziti noodles'
union select 'tomatoe paste'
union select 'muenster cheese'
union select 'warm water'
union select 'white wine'
union select 'oats'
union select 'vanilla ice cream'
union select 'heavy cream'

insert Recipe(CreatedByUserId, CuisineId, RecipeName, CalorieCount, DateDrafted, DatePublished, DateArchived)
      select (select u.UserId from Users u where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'American'), 'Saucy Franks', 320, '2002-05-17', '2002-05-17', null
union select (select u.UserId from Users u where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'British'), 'Potato Bourekas', 140, '2007-05-16', '2007-08-13', '2010-09-30'
union select (select u.UserId from Users u where u.UserFirstName = 'Victoria' and u.UserLastName =  'Dweck' and u.UserPassword = 'DweckVicy01'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'French'), 'French Onion Soup', 180, '2000-03-02', '2000-03-02', null
union select (select u.UserId from Users u where u.UserFirstName = 'Victoria' and u.UserLastName =  'Dweck' and u.UserPassword = 'DweckVicy01'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Mediterranean'), 'Vegetable-Squash Soup', 60, '2015-12-09', '2015-12-10', null
union select (select u.UserId from Users u where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'American'), 'Sweet Cheese Toasts', 220, '2022-01-11', null, null
union select (select u.UserId from Users u where u.UserFirstName = 'Miriam' and u.UserLastName =  'Pascal' and u.UserPassword = 'MPK2020'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Italian'), 'Pina Colada Drink', 150, '2018-05-07', '2018-05-09', '2020-09-21'
union select (select u.UserId from Users u where u.UserFirstName = 'Miriam' and u.UserLastName =  'Pascal' and u.UserPassword = 'MPK2020'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Israeli'), 'Sweet Lokshen Kugel', 180, '2004-07-08', '2005-04-20', null
union select (select u.UserId from Users u where u.UserFirstName = 'Chanie' and u.UserLastName =  'Nayman' and u.UserPassword = 'Chan613'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Greek'), 'Sweet Potato Chips', 360, '2000-01-17', '2000-01-17', null
union select (select u.UserId from Users u where u.UserFirstName = 'Chanie' and u.UserLastName =  'Nayman' and u.UserPassword = 'Chan613'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Moroccan'), 'Spicy Orzo', 110, '2019-05-04', '2019-05-31', null
union select (select u.UserId from Users u where u.UserFirstName = 'Libby' and u.UserLastName =  'Gold' and u.UserPassword = 'gl1000'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Chinese'), 'Sesame Chicken', 320, '2021-02-28', '2021-03-18', null
union select (select u.UserId from Users u where u.UserFirstName = 'Libby' and u.UserLastName =  'Gold' and u.UserPassword = 'gl1000'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'American'), 'Sweet ''N Sour Tongue', 260, '2022-01-15', '2022-01-27', null
union select (select u.UserId from Users u where u.UserFirstName = 'Libby' and u.UserLastName =  'Gold' and u.UserPassword = 'gl1000'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'American'), 'Glazed Corned Beef', 240, '2021-11-22', '2022-02-12', null
union select (select u.UserId from Users u where u.UserFirstName = 'Libby' and u.UserLastName =  'Gold' and u.UserPassword = 'gl1000'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'Italian'), 'Baked Ziti', 420, '2010-01-07', '2010-03-13', null
union select (select u.UserId from Users u where u.UserFirstName = 'Libby' and u.UserLastName =  'Gold' and u.UserPassword = 'gl1000'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'French'), 'White Wine Doughnuts', 400, '2020-03-07', null, '2021-12-13'
union select (select u.UserId from Users u where u.UserFirstName = 'Pessi' and u.UserLastName =  'Grun' and u.UserPassword = 'Pg@1648'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'British'), 'Old-Fashioned Oatmeal Cookies', 260, '2003-07-21', '2003-07-21', null
union select (select u.UserId from Users u where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'),
             (select c.CuisineId from Cuisine c where c.CuisineName = 'American'), 'Thick & Rich Milkshakes', 500, '2015-03-16', '2015-03-16', null 

insert RecipeIngredient(RecipeId, IngredientId, MeasurementTypeId, Amount, SequenceNum)
      select(select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), (select i.IngredientId from Ingredient i where i.IngredientName = 'franks'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'regular'), 6, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), (select i.IngredientId from Ingredient i where i.IngredientName = 'red currant jelly'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'jar'), 1, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), (select i.IngredientId from Ingredient i where i.IngredientName = 'spicy brown mustard'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 4, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'puff pastry squares'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'squares'), 12, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'potatoes'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 3, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'onions'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'small'), 2, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 6, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'portobello mushroom'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 1, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'egg'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'extra-large'), 1, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sesame seeds'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'sprinkle'), null, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'butter'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 4, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 2, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'onions'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 7, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'minced garlic'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 2, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'basil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'thyme'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'flour'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 3, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'water'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 8, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt and pepper'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'butternut squash'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'large'), 1, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sweet potato'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'large'), 1, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'celery'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'stalks'), 2, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'carrots'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 3, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'shredded cabbage'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), 1, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'zucchini'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 2, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'water'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 2, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'marjoram'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'cumin'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), .5, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), .5, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'bread'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'slices'), 2, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'cottage cheese'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'cinnamon'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), .5, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 3, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), (select i.IngredientId from Ingredient i where i.IngredientName = 'pineapple juice'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 92, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), (select i.IngredientId from Ingredient i where i.IngredientName = 'crushed pineapple'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 40, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), (select i.IngredientId from Ingredient i where i.IngredientName = 'pina colada syrup'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 50, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), (select i.IngredientId from Ingredient i where i.IngredientName = 'whip cream'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 20, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), (select i.IngredientId from Ingredient i where i.IngredientName = 'kiwi'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 5, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'noodles'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 12, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'applesauce'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), 1, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'eggs'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'extra-large'), 3, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'package'), 1, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), 1, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), (select i.IngredientId from Ingredient i where i.IngredientName = 'cinnamon'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'sprinkle'), null, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sweet potatoes'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'large'), 5, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), (select i.IngredientId from Ingredient i where i.IngredientName = 'olive oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 4, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), (select i.IngredientId from Ingredient i where i.IngredientName = 'garlic powder'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt and pepper'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'orzo'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'lb'), 1, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'garlic'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cloves'), 6, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 6, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 6, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vinager'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 6, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'soy sauce'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 6, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'olive oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 6, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'crushed red pepper'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 8
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sesame seeds'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 9
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'chicken cutlets'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 4, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'ketchup'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .33, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'mayonnaise'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .33, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'apricot jam'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .33, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'honey'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .33, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'lemon juice'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'capful'), 1, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'onion soup mix'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'mustard'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 1, 8
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sesame seeds'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 9
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'eggs'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'extra-large'), 2, 10
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'bread crumbs'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'as necessary'), null, 11
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'as necessary'), null, 12
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'pickled tongue'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'medium'), 1, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'onions'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'large'), 2, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'tomatoe sauce'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 15, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'water'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'brown sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .33, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'lemon juice'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 2, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), (select i.IngredientId from Ingredient i where i.IngredientName = 'orange juice'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), (select i.IngredientId from Ingredient i where i.IngredientName = 'Corned beef'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'lb'), 2.5, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oil'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 2, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), (select i.IngredientId from Ingredient i where i.IngredientName = 'mustard'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 1, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), (select i.IngredientId from Ingredient i where i.IngredientName = 'ketchup'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 5, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vinager'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 2, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), (select i.IngredientId from Ingredient i where i.IngredientName = 'brown sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'ziti noodles'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'lb'), 1, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'onions'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'small'), 3, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'tomatoe paste'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 12, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'tomatoe sauce'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 8, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'water'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 1.5, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'salt'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'garlic powder'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'to taste'), null, 8
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), (select i.IngredientId from Ingredient i where i.IngredientName = 'muenster cheese'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'packages'), 2, 9
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'flour'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 7.5, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'margarine'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'stick'), .5, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'eggs'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'extra-large'), 3, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'yeast'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'oz'), 2, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'warm water'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), 1, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'package'), 1, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tbsp'), 4, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'orange juice'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .67, 8
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), (select i.IngredientId from Ingredient i where i.IngredientName = 'white wine'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .33, 9
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'margarine'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .75, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'sugar'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 1.5, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'eggs'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'extra-large'), 2, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla extract'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 4
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'water'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), 1, 5
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'chocolate chips'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), 1, 6
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'flour'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 2.5, 7
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'baking soda'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), .5, 8
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'baking powder'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 9
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), (select i.IngredientId from Ingredient i where i.IngredientName = 'oats'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 2, 10
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Thick & Rich Milkshakes'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla ice cream'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cups'), 2, 1
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Thick & Rich Milkshakes'), (select i.IngredientId from Ingredient i where i.IngredientName = 'milk'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 2
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Thick & Rich Milkshakes'), (select i.IngredientId from Ingredient i where i.IngredientName = 'heavy cream'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'cup'), .5, 3
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Thick & Rich Milkshakes'), (select i.IngredientId from Ingredient i where i.IngredientName = 'vanilla extract'),
            (select mt.MeasurementTypeId from MeasurementType mt where mt.MeasurementTypeName = 'tsp'), 1, 4

insert RecipeStep(RecipeId, SequenceNum, StepDesc)
      select(select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), 1,'Cut the hot dogs into 1 inch thick slices and place into pot.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), 2, 'Add red currant jelly and mustard.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), 3, 'Cook on medium flame, uncovered for 15-20 minutes, stirring as necessary. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 1, 'Peel and dice potatoes, cook covered in salted water until soft.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 2, 'While potatoes are cooking, dice onions and mushrooms and saute` in oil, add salt to taste.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 3, 'Once potatoes are done, drain water and mash potatoes with fork.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 4, 'Mix mashed potatoes with onion and mushroom mixture.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 5, 'Spread out puff pastry squares on a flat surface, stretching them slightly.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 6, 'Scoop 1 tablespoon of mashed potatoes onto upper right corner of pasty square leaving 1 cm of the upper and right side still visable.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 7, 'Bring lower left corner, over mashed potatoes, to the upper right corner, seal the edges (side and top) shut with a metal fork.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 8, 'Brush bourekas with scrampled egg and top with sesame seeds.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 9, 'Bake at 350 until golden brown. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), 1, 'In a 4 quart pot, melt butthe and oil over moderate heat.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), 2, 'Add onions and seasonings and cook, stirring occasionally for 20-30 minutes until onions are golden brown.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), 3, 'Sprinkle flour over onions and continue stirring for 2-3 minutes.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), 4, 'While stirring, add water gradually and simmer, covered, for 40 more minutes.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), 5, 'Add salt and pepper to taste. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), 1, 'Peel, seed, and dice squash and vegatables.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), 2, 'Place all vegatable in a 4 quart pot; add water and seasonings.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), 3, 'Bring to a boil and simmer until vegatables are tender, approximately 1 hour.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), 4, 'When cool, use an immersion blender to puree vegatables.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), 5, 'Reheat when ready to serve. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), 1, 'Toast the two slices of bread and set aside on a piece of aluminum foil.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), 2, 'Mix cottage cheese, sugar and cinnamon in a bowl.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), 3, 'Spread the cottage cheese mixture over the bread and place in toaster oven on toast for 1 cycle on medium heat. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), 1, 'In a blender on high speed, blend the crushed pineapple until smooth.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), 2, 'Beat the whip cream until stiff.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), 3, 'Combine all ingredients except kiwi and mix by hand.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), 4, 'Pour into individual parfait glasses.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), 5, 'Garnish with a slice of kiwi and serve with a thin straw. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), 1, 'Cook and drain noodles.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), 2, 'Add remaining ingredients and mix well.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), 3, 'Sprinkle with cinnamon.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), 4, 'Bake in 9x13 for 1 hour at 350. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), 1, 'Peel and slice sweet potatoes.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), 2, 'Brush sweet potatoes on both sides with olive oil, place flat on baking sheets or pans, and sprinke with seasoning to taste.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), 3, 'Bake at 350 for 45 minutes to an hour. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), 1, 'Cook and drain orzo;  place in a 9x13 pan.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), 2, 'Place remaining ingredients in a small pot, cook on a low heat until it starts bubbling.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), 3, 'Remove cloves of garlic and pour sauce mixture over orzo and mix.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), 4, 'Reheat when ready to serve. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 1, 'Cut chicken into bite-size nuggets.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 2, 'Dip nuggets into beaten eggs, then into breadcrumbs and fry in hot oil.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 3, 'Combine remaining ingredients, excluding sesame seeds, in medium saucepan and cook for 10 minutes.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 4, 'Place fried nuggets on the bottom of a 9x13 baking pan.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 5, 'Pour cooked mixture over chicken. Chicken should be completely covered with sauce.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 6, 'Cover well and bake at 350 for 1 hour.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 7, 'Remove from oven and sprinkle with sesame seeds while hot. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 1, 'Cook tongue in water until tender.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 2, 'Remove tongue from water and peel while still hot.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 3, 'Cool completely and slice.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 4, 'Bring onions, tomatoe sauce and water to a boil.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 5, 'Add tongue slices and remaining ingredients.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 6, 'Cook for 2-2.5 hours. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), 1, 'Cook corned beef in a 4 quart pot, covered in water on a medium flame for 45 minutes.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), 2, 'Combind the rest of the ingredients in a pot and stir until it boils.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), 3, 'Slice corned beef and pour glaze over it.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), 4, 'Bake in oven at 325 for half an hour. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 1, 'Cook noodles and drain.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 2, 'Saute` onions, adding tomatoe paste, sauce and water. Mix well and cook for half an hour.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 3, 'Add spices and sugar to taste.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 4, 'Pour half of sauce into 10x15 pan.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 5, 'Lay one package of muenster cheese over the sauce. Then put in the noodles. Then then other half of the sauce. Then top with remaining package of cheese.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 6, 'Bake covered at 350 for half an hour. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 1, 'Dissolve yeast in warm water.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 2, 'Knead all ingredients in a large bowl.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 3, 'Let rise for 1 hour.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 4, 'Roll out on board, cut round or doughnut shapes and place on greased surface.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 5, 'Allow to rise for another half hour.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 6, 'Heat oil in heavy, deep pot. When hot, drop doughnuts in, dry side down.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 7, 'Turn doughnuts in oil to brown on both sides. When done, place on paper towel to drain.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 8, 'Sprinkle with confectioners'' sugar when cooled. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), 1, 'Preheat oven to 400.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), 2, 'Combine margarine, sugar, eggs, and vanilla; mix well.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), 3, 'Blend in remaining ingredients and mix well.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), 4, 'Drop dough by rounded tablespoons, 2" apart, onto ungreased cookie sheet.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), 5, 'Bake about 15 minutes until lightly browned. Enjoy!'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Thick & Rich Milkshakes'), 1, 'Place all ingredients into blender; cover and blend until smooth.'
union select(select r.RecipeId from Recipe r where r.RecipeName = 'Thick & Rich Milkshakes'), 2, 'Pour into tall glass and serve. Enjoy!'

insert Meal(UserId, MealTitle, DateCreated, Active)
      select (select u.UserId from Users u where u.UserFirstName = 'Victoria' and u.UserLastName =  'Dweck' and u.UserPassword = 'DweckVicy01'), 'Signature Family Anniversary Dinner', GETDATE(), 1
union select (select u.UserId from Users u where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'), 'Patio Picnic Lunch', '2020-02-24', 1
union select (select u.UserId from Users u where u.UserFirstName = 'Malky' and u.UserLastName =  'Freidman' and u.UserPassword = 'Malks69'), 'Quick-fix Breakfast', '2018-09-08', 0

insert Course(CourseName, SequenceNum)
      select 'Appetizer/Entree', 1
union select 'Soup', 2
union select 'Main', 3
union select 'Dessert', 4

insert MealCourse(MealId, CourseId)
      select m.MealId, c.CourseId from Meal m cross join Course c where m.MealTitle <> 'Quick-fix Breakfast'
union select (select m.MealId from Meal m where m.MealTitle = 'Quick-fix Breakfast'), (select c.CourseId from Course c where c.CourseName = 'Main')

insert RecipeMealCourse(RecipeId, MealCourseId, Main)
      select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Saucy Franks' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Appetizer/Entree'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Potato Bourekas' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Appetizer/Entree'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Pina Colada Drink' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Appetizer/Entree'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sweet ''N Sour Tongue' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Appetizer/Entree'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Vegetable-Squash Soup' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Soup'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sesame Chicken' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Glazed Corned Beef' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sweet Potato Chips' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Spicy Orzo' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sweet Lokshen Kugel' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'White Wine Doughnuts' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Dessert'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Old-Fashioned Oatmeal Cookies' and m.MealTitle = 'Signature Family Anniversary Dinner' and c.CourseName = 'Dessert'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Thick & Rich Milkshakes' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Appetizer/Entree'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Pina Colada Drink' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Appetizer/Entree'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'French Onion Soup' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Soup'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Baked Ziti' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sweet Cheese Toasts' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sweet Potato Chips' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Old-Fashioned Oatmeal Cookies' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Dessert'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'White Wine Doughnuts' and m.MealTitle = 'Patio Picnic Lunch' and c.CourseName = 'Dessert'
union select r.RecipeId, mc.MealCourseId, 1 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Sweet Cheese Toasts' and m.MealTitle = 'Quick-fix Breakfast' and c.CourseName = 'Main'
union select r.RecipeId, mc.MealCourseId, 0 from Recipe r cross join Meal m join MealCourse mc on m.MealId = mc.MealId join Course c on mc.CourseId = c.CourseId 
            where r.RecipeName = 'Thick & Rich Milkshakes' and m.MealTitle = 'Quick-fix Breakfast' and c.CourseName = 'Main'

insert Cookbook(UserId, CookbookTitle, Price, Active, DateCreated)
      select(select u.UserId from Users u where u.UserFirstName = 'Libby' and u.UserLastName =  'Gold' and u.UserPassword = 'gl1000'), 'Mom''s Kitchen', 39.99, 1, '2021-02-13'
union select (select u.UserId from Users u where u.UserFirstName = 'Miriam' and u.UserLastName =  'Pascal' and u.UserPassword = 'MPK2020'), 'DIY Restaurant Favorites', 42.99, 1, '2022-01-15'
union select (select u.UserId from Users u where u.UserFirstName = 'Miriam' and u.UserLastName =  'Pascal' and u.UserPassword = 'MPK2020'), 'Easy Dinners', 24.99, 0, '2022-02-03'

insert CookbookRecipe(CookbookId, RecipeId, SequenceNum)
      select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Saucy Franks'), 1
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Vegetable-Squash Soup'), 2
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Potato Chips'), 3
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Cheese Toasts'), 4
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet Lokshen Kugel'), 5
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Glazed Corned Beef'), 6
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 7
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Mom''s Kitchen'), (select r.RecipeId from Recipe r where r.RecipeName = 'Old-Fashioned Oatmeal Cookies'), 8
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'Pina Colada Drink'), 1
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'Potato Bourekas'), 2
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'French Onion Soup'), 3
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'Spicy Orzo'), 4
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'Sesame Chicken'), 5
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'Sweet ''N Sour Tongue'), 6
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'DIY Restaurant Favorites'), (select r.RecipeId from Recipe r where r.RecipeName = 'White Wine Doughnuts'), 7
union select (select cb.CookbookId from Cookbook cb where cb.CookbookTitle = 'Easy Dinners'), (select r.RecipeId from Recipe r where r.RecipeName = 'Baked Ziti'), 1