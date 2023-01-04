create or alter procedure dbo.RecipeIngredientsGet(@RecipeId int, @Message varchar(1000) = '' output)
as
begin
    declare @Return int
        select @RecipeId = ISNULL(@RecipeId,0)
        
        select r.RecipeId, Ingredients = 
        case 
        when mt.MeasurementTypeName in('to taste', 'as necessary') then CONCAT(i.IngredientName, ' ', mt.MeasurementTypeName )
        else CONCAT(ri.Amount, ' ', mt.MeasurementTypeName, ' ', i.IngredientName )
        end
        from Recipe r 
        join RecipeIngredient ri 
        on r.RecipeId = ri.RecipeId
        join MeasurementType mt
        on ri.MeasurementTypeId = mt.MeasurementTypeId
        join Ingredient i 
        on ri.IngredientId = i.IngredientId
        where r.RecipeId = @RecipeId
        order by ri.SequenceNum
    return @Return
end
go

exec RecipeIngredientsGet 1