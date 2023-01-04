create or alter procedure dbo.RecipeGet(
     @RecipeId int = 0, 
     @RecipeCode varchar(80) = '',
     @All bit = 0, 
     @Message varchar(1000) = '' output)
as
begin
     declare @Return int
          select @RecipeId = ISNULL(@RecipeId,0)
     
          select r.RecipeId, r.RecipeName, r.CalorieCount, TotalIngredients = COUNT(distinct ri.IngredientId), TotalSteps = COUNT(distinct rs.SequenceNum), r.CreatedByUserId, u.UserFullName,r.DateDrafted, r.DatePublished, r.DateArchived, r.CuisineId, c.CuisineName, r.RecipeStatus, r.RecipeCode
          from Recipe r 
          left join RecipeIngredient ri
          on r.RecipeId = ri.RecipeId
          left join RecipeStep rs 
          on r.RecipeId = rs.RecipeId
          left join Users u 
          on r.CreatedByUserId = u.UserId
          left join Cuisine c
          on r.CuisineId = c.CuisineId
          where r.RecipeId = @RecipeId
               or @All = 1
               or r.RecipeCode = @RecipeCode
          group by r.RecipeId, r.RecipeName, r.CalorieCount, r.CreatedByUserId, u.UserFullName, r.DateDrafted, r.DatePublished, r.DateArchived, r.CuisineId, c.CuisineName, r.RecipeStatus, r.RecipeCode
     return @Return
end

go


--exec RecipeGet @RecipeId = 1, @All = 0

exec RecipeGet @recipecode = 'baked-ziti'

