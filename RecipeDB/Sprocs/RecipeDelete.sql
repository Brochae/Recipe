create or alter procedure dbo.RecipeDelete(@RecipeId int, @Message varchar(1000) = '' output )
as
    begin
        declare @Return int

            delete ri
            from RecipeIngredient ri
            join Recipe r
            on ri.RecipeId = r.RecipeId
            where ri.RecipeId = @RecipeId
    
            delete rs
            from RecipeStep rs 
            join Recipe r 
            on rs.RecipeId = r.RecipeId
            where rs.RecipeId = @RecipeId
    
            delete rmc
            from RecipeMealCourse rmc 
            join Recipe r 
            on rmc.RecipeId = r.RecipeId 
            where rmc.RecipeId = @RecipeId
    
            delete cr
            from CookbookRecipe cr 
            join Recipe r 
            on cr.RecipeId = r.RecipeId
            where cr.RecipeId = @RecipeId
    
            delete r 
            from Recipe r
            where r.RecipeId = @RecipeId

        return @Return
    end
go