declare @RecipeId int

select top 1 @RecipeId = r.RecipeId
from Recipe r
order by r.RecipeId

exec RecipeDelete @RecipeId = @RecipeId

select * from Recipe 