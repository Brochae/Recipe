declare @RecipeId int, @CreatedByUserId int, @CuisineId int

delete Recipe where RecipeName = 'Mac and Cheese'

exec RecipeUpdate
@RecipeId = @RecipeId output,
@CreatedByUserId = @CreatedByUserId output,
@CuisineId = @CuisineId output,
@RecipeName = 'Mac and Cheese',
@CalorieCount = 420,
@DateDrafted = null

select * from Recipe

