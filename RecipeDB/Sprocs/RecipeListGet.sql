create or alter procedure dbo.RecipeListGet(@Message varchar(1000) = '' output)
as
begin
    declare @Return int
        select r.RecipeId, r.RecipeName 
        from Recipe r
    return @Return
end
go

exec RecipeListGet