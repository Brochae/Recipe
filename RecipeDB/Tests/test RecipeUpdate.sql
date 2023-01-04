declare @RecipeId int, @CreatedByUserId int, @CuisineId int, @RecipeName varchar(80)

select top 1
    @RecipeId = r.RecipeId, @CreatedByUserId = r.CreatedByUserId, @CuisineId = r.CuisineId, @RecipeName = REVERSE(r.RecipeName)
from Recipe r
where r.CalorieCount <> 420


exec RecipeUpdate
@RecipeId = @RecipeId output,
@CreatedByUserId = @CreatedByUserId output,
@CuisineId = @CuisineId output,
@RecipeName = @RecipeName output,
@CalorieCount = 420,
@DateDrafted = null,
@DatePublished = null,
@DateArchived = null

select * from Recipe

