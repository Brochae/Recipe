create or alter procedure dbo.RecipeStepsGet(@RecipeId int, @Message varchar(1000) = '' output)
as
begin
    declare @Return int
        select @RecipeId = ISNULL(@RecipeId,0)

        select r.RecipeId, rs.SequenceNum, rs.StepDesc
        from Recipe r
        join RecipeStep rs
        on r.RecipeId = rs.RecipeId 
        where r.RecipeId = @RecipeId
        order by rs.SequenceNum 
    return @Return
end
go

exec RecipeStepsGet 1