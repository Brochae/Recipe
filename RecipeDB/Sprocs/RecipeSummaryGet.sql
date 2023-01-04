create or alter procedure dbo.RecipeSummaryGet(@Message varchar(1000) = '' output)
as
begin
    declare @Return int
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
    return @Return
end

go 

exec RecipeSummaryGet