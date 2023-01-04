--AS Amazing job! 100%
use RecipeDB
/*
Home Page
    One resultset with number of recipes, meals, and cookbooks
*/
--AS This has to be returned in one result set.
--BE It is one result set (they are connected with the union select). Do you mean one select statement/one row? 
--BE I tried doing it below - it's a lot less concise, but it gets the same results...
--BE Please explain why the second one is necessary. Thank you.
--AS Yes sorry I intended to say one select statement. Even though it seems like more code, the second way is more concise and cleaner code.
      select CountOf = 'Recipes', Total = COUNT(r.RecipeName) from Recipe r
union select 'Meals', COUNT(m.MealTitle) from Meal m 
union select 'Cookbooks', COUNT(cb.CookbookTitle) from Cookbook cb 

select CountOfRecipes = COUNT(distinct r.RecipeName), CountOfMeals = COUNT(distinct m.MealTitle), CountOfCookbooks = COUNT(distinct cb.CookbookTitle)
from Recipe r 
left join RecipeMealCourse rmc 
on r.RecipeId = rmc.RecipeId
left join MealCourse mc 
on rmc.MealCourseId = mc.MealCourseId
left join Meal m 
on mc.MealId = m.MealId
left join CookbookRecipe cr 
on r.RecipeId = cr.RecipeId
left join Cookbook cb 
on cr.CookbookId = cb.CookbookId

/*
Recipe list page:
    List of all Recipes that are either published or archived, published recipes should appear at the top.
    In the resultset show the Recipe with its status, dates it was published and archived (blank if not archived), user, number of calories and number of ingredients.
*/

select r.RecipeName, r.RecipeStatus, DatePublished = ISNULL(CONVERT(varchar, r.DatePublished), ''), DateArchived = ISNULL(CONVERT(varchar, r.DateArchived), ''), u.UserFirstName, u.UserLastName, r.CalorieCount, TotalIngredients = COUNT(ri.IngredientId)
from Recipe r 
join Users u
on r.CreatedByUserId = u.UserId
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
where r.RecipeStatus in('Published', 'Archived')
group by r.RecipeName, r.RecipeStatus, r.DatePublished, r.DateArchived, u.UserFirstName, u.UserLastName, r.CalorieCount
order by r.RecipeStatus desc 

/*
Recipe details page:
    Show for a specific recipe (three lists):
        a) Recipe header: recipe name, number of calories, number of ingredients and number of steps.
        b) List of ingredients: show the ingredient, measurement type and quantity in one column, sorted by sequence.    
        c) List of prep steps sorted by sequence.
*/

--Recipe header
select r.RecipeName, r.CalorieCount, TotalIngredients = COUNT(distinct ri.IngredientId), TotalSteps = COUNT(distinct rs.SequenceNum)
from Recipe r 
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
join RecipeStep rs 
on r.RecipeId = rs.RecipeId
where r.RecipeName = 'Thick & Rich Milkshakes'
group by r.RecipeName, r.CalorieCount

--List of Ingredients
select Ingredients = CONCAT(i.IngredientName, ' ', ri.Amount, ' ', mt.MeasurementTypeName)
from Recipe r 
join RecipeIngredient ri 
on r.RecipeId = ri.RecipeId
join MeasurementType mt
on ri.MeasurementTypeId = mt.MeasurementTypeId
join Ingredient i 
on ri.IngredientId = i.IngredientId
where r.RecipeName = 'Thick & Rich Milkshakes'
order by ri.SequenceNum

--List of Prep Steps
select rs.SequenceNum, rs.StepDesc
from Recipe r 
join RecipeStep rs 
on r.RecipeId = rs.RecipeId
where r.RecipeName = 'Thick & Rich Milkshakes'
order by rs.SequenceNum

/*
Meal list page:
    All active meals, number of courses and number of recipes per each meal
*/

select m.MealTitle, TotalCourses = COUNT(distinct mc.MealCourseId), TotalRecipes = COUNT(rmc.RecipeId)
from Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join RecipeMealCourse rmc 
on mc.MealCourseId = rmc.MealCourseId
where m.Active = 1
group by m.MealTitle

/*
Meal details page:
    Show for a specific meal:
        a) Meal header: meal name, user, date created.
        b) List of all recipes. 
            Display in one column the course type, recipe, and for the main course show which dishes are main and which are side. 
                ex: 
                    Appetizer: Mixed Greens
                        Main: Main dish - Onion Pastrami Chicken
*/

--Meal Header
select m.MealTitle, u.UserFirstName, u.UserLastName, m.DateCreated
from Meal m 
join Users u 
on m.UserId = u.UserId
where m.MealTitle = 'Signature Family Anniversary Dinner'

--List of Recipes
select 
Dishes = 
    case
        when c.CourseName = 'Main' then CONCAT(c.CourseName, ': ', rmc.DishTypeDesc, ' - ', r.RecipeName)
        else CONCAT(c.CourseName, ': ', r.RecipeName)
    end
from Meal m 
join MealCourse mc 
on m.MealId = mc.MealId
join Course c 
on mc.CourseId = c.CourseId
join RecipeMealCourse rmc 
on mc.MealCourseId = rmc.MealCourseId
join Recipe r 
on rmc.RecipeId = r.RecipeId
where m.MealTitle = 'Signature Family Anniversary Dinner'
order by c.SequenceNum, rmc.DishTypeDesc, r.RecipeName

/*
Cookbook list page:
    Show all active cookbooks and number of recipes per book.
*/

select cb.CookbookTitle, NumOfRecipes = COUNT(cr.RecipeId)
from Cookbook cb 
join CookbookRecipe cr 
on cb.CookbookId = cr.CookbookId
where cb.Active = 1
group by cb.CookbookTitle

/*
Cookbook details page:
    Show for specific cookbook:
    a) Cookbook header: cookbook name, user, date created, price, number of recipes.
    b) List of all recipes in the correct order. Include recipe name, cuisine and number of ingredients and steps.  Note: User will click on recipe to see all ingredients and steps.
*/

--Cookbook header
select cb.CookbookTitle, u.UserFirstName, u.UserLastName, cb.DateCreated, cb.Price, NumOfRecipes = COUNT(cr.RecipeId)
from Cookbook cb 
join Users u 
on cb.UserId = u.UserId
join CookbookRecipe cr 
on cb.CookbookId = cr.CookbookId
where cb.CookbookTitle = 'Mom''s Kitchen'
group by cb.CookbookTitle, u.UserFirstName, u.UserLastName, cb.DateCreated, cb.Price

--List of Recipes
select r.RecipeName, c.CuisineName, TotalIngredients = COUNT(distinct ri.IngredientId), TotalSteps = COUNT(distinct rs.SequenceNum)
from Cookbook cb
join CookbookRecipe cr
on cb.CookbookId = cr.CookbookId
join Recipe r 
on cr.RecipeId = r.RecipeId
join Cuisine c 
on r.CuisineId = c.CuisineId
join RecipeIngredient ri
on r.RecipeId = ri.RecipeId
join RecipeStep rs 
on r.RecipeId = rs.RecipeId
where cb.CookbookTitle = 'Mom''s Kitchen'
group by r.RecipeName, c.CuisineName, cr.SequenceNum
order by cr.SequenceNum

/*
For site administration:
    List of how many recipes each user created per status. Show 0 if none
    List of how many meals each user created and whether they're active or inactive. Show 0 if none
    List of how many cookbooks each user created and whether they're active or inactive. Show 0 if none
    List of archived recipes that were never published.
*/

--List of how many recipes each user created per status. Show 0 if none
select u.UserFirstName, u.UserLastName, r.RecipeStatus, NumOfMealsPerStatus = COUNT(r.RecipeId)
from Users u 
left join Recipe r 
on u.UserId = r.CreatedByUserId
group by u.UserFirstName, u.UserLastName, u.UserPassword, r.RecipeStatus
order by u.UserFirstName, u.UserLastName, r.RecipeStatus

--List of how many meals each user created and whether they're active or inactive. Show 0 if none
select u.UserFirstName, u.UserLastName, NumOfMealsCreated = COUNT(m.MealId), MealStatus = ISNULL(m.MealStatus, '')
from Users u 
left join Meal m 
on u.UserId = m.UserId
group by u.UserFirstName, u.UserLastName, u.UserPassword, m.MealStatus
order by u.UserFirstName, u.UserLastName

--List of how many cookbooks each user created and whether they're active or inactive. Show 0 if none
select u.UserFirstName, u.UserLastName, NumOfCookbooksCreated = COUNT(cb.CookbookId), CookbookStatus = ISNULL(cb.CookbookStatus, '')
from Users u 
left join Cookbook cb 
on u.UserId = cb.UserId
group by u.UserFirstName, u.UserLastName, u.UserPassword, cb.CookbookStatus

--List of archived recipes that were never published.
select *
from Recipe r 
where r.DatePublished is null and r.DateArchived is not null

/*
For a specific company user:
    Show number of his/her recipes, meals and cookbooks. 
    List of his/her recipes, display the status and the number of months between the status it's in and the one before that. Show null if recipe has the status drafted.
    Count of his/her recipes per cuisine. Show 0 for none.
*/

--Show number of his/her recipes, meals and cookbooks.
select u.UserFirstName, u.UserLastName, NumOfRecipes = COUNT(r.RecipeId), NumOfMeals = COUNT(distinct m.MealId), NumOfCookbooks = COUNT(distinct cb.CookbookId)
from Users u 
left join Recipe r 
on u.UserId = r.CreatedByUserId
left join Meal m 
on u.UserId = m.UserId
left join Cookbook cb 
on u.UserId = cb.UserId
where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'
group by u.UserFirstName, u.UserLastName, u.UserPassword

--List of his/her recipes, display the status and the number of months between the status it's in and the one before that. Show null if recipe has the status drafted.
select r.RecipeName, r.RecipeStatus, MonthsItWasAtPreviouseStatus =
    case 
        when r.DatePublished is not null and r.DateArchived is null then DATEDIFF(MONTH, r.DateDrafted, r.DatePublished)
        when r.DatePublished is null and r.DateArchived is not null then DATEDIFF(MONTH, r.DateDrafted, r.DateArchived)
        when r.DatePublished is not null and r.DateArchived is not null then DATEDIFF(MONTH, r.DatePublished, r.DateArchived)
        else null
    end,
r.DateDrafted, r.DatePublished, r.DateArchived
from Users u 
join Recipe r 
on u.UserId = r.CreatedByUserId
where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'

--Count of his/her recipes per cuisine. Show 0 for none.
/*
select c.CuisineName, NumOfRecipes = COUNT(r.RecipeId)
from Cuisine c 
cross join Users u 
left join Recipe r 
on c.CuisineId = r.CuisineId and r.CreatedByUserId = u.UserId
where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'
group by c.CuisineName, u.UserFirstName, u.UserLastName, u.UserPassword
*/

select c.CuisineName, NumOfRecipes = COUNT(r.RecipeId)
from Users u 
left join Recipe r 
on u.UserId = r.CreatedByUserId
left join Cuisine c 
on r.CuisineId = c.CuisineId
where u.UserFirstName = 'Susie' and u.UserLastName =  'Fishbein' and u.UserPassword = 'SusFish6576!'
group by c.CuisineName
