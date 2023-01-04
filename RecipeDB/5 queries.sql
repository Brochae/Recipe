select * from Recipe r 

select * from Meal m 

select u.UserFirstName, u.UserLastName, r.RecipeName, cu.CuisineName, r.CalorieCount, r.RecipeStatus  
from Recipe r 
join Users u 
on r.CreatedByUserId = u.UserId
join Cuisine cu
on r.CuisineId = cu.CuisineId

select r.RecipeName, ri.Amount, mt.MeasurementTypeName, i.IngredientName
from Recipe r 
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join MeasurementType mt
on ri.MeasurementTypeId = mt.MeasurementTypeId
join Ingredient i 
on ri.IngredientId = i.IngredientId

select r.RecipeName, rs.SequenceNum, rs.StepDesc
from Recipe r 
join RecipeStep rs 
on r.RecipeId = rs.RecipeId

select u.UserFirstName, u.UserLastName, m.MealTitle, c.CourseName, rmc.DishTypeDesc, r.RecipeName
from Meal m 
join Users u 
on m.UserId = u.UserId
join MealCourse mc
on m.MealId = mc.MealId
join Course c 
on mc.CourseId = c.CourseId
join RecipeMealCourse rmc
on mc.MealCourseId = rmc.MealCourseId
join Recipe r 
on rmc.RecipeId = r.RecipeId
order by m.MealTitle, c.SequenceNum, rmc.DishTypeDesc

select m.MealTitle, CaloriesPerMeal = SUM(r.CalorieCount)
from Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join RecipeMealCourse rmc
on mc.MealCourseId = rmc.MealCourseId
join Recipe r 
on rmc.RecipeId = r.RecipeId
group by m.MealTitle

select cb.CookbookTitle, r.RecipeName
from Cookbook cb
join CookbookRecipe cr
on cb.CookbookId = cr.CookbookId
join Recipe r 
on cr.RecipeId = r.RecipeId
order by cb.CookbookTitle, cr.SequenceNum

select u.UserFirstName, u.UserLastName, m.MealTitle, c.CourseName, rmc.DishTypeDesc, r.RecipeName
from Meal m 
join Users u 
on m.UserId = u.UserId
join MealCourse mc
on m.MealId = mc.MealId
join Course c 
on mc.CourseId = c.CourseId
join RecipeMealCourse rmc
on mc.MealCourseId = rmc.MealCourseId
join Recipe r 
on rmc.RecipeId = r.RecipeId
where m.MealId = (select m.mealid from meal m where m.MealTitle = @MealTitle)
order by m.MealTitle, c.SequenceNum, rmc.DishTypeDesc


declare @DishTypeDesc varchar = 'main'
declare @MealId int = 1
declare @recipename varchar 

select r.RecipeName, rmc.DishTypeDesc
from Recipe r 
join RecipeMealCourse rmc 
on r.RecipeId = rmc.RecipeId
join MealCourse mc 
on rmc.MealCourseId = mc.MealCourseId
join Meal m 
on mc.MealId = m.MealId
where m.MealId = @MealId
and DishTypeDesc <> @DishTypeDesc
and CONVERT( varchar, r.RecipeId) like ISNULL(CONVERT(varchar, (select r.recipeId from recipe r where r.recipename = @recipename)),'%')