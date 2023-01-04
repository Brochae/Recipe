
create or alter procedure dbo.RecipeUpdate(
@RecipeId int output,
@CreatedByUserId int,
@UserFullName varchar(71) = '',
@CuisineId int,
@CuisineName varchar(50) = '',
@RecipeName varchar(80),
@CalorieCount int,
@TotalSteps int = 0 output,
@TotalIngredients int = 0 output,
@DateDrafted date output,
@DatePublished date = null output,
@DateArchived date = null output,
@Message varchar(1000) = '' output,
@RecipeStatus varchar(10) = '' output,
@RecipeCode varchar(80) = '' output
--@RecipeStatus varchar
)
as
begin 
    declare @Return int
    select @RecipeId = ISNULL(@RecipeId,0), @CalorieCount = ISNULL(@CalorieCount, 0), @DateDrafted = ISNULL(@DateDrafted, GETDATE()), @RecipeCode = ISNULL(@RecipeCode, ''), @CuisineName = ISNULL(@CuisineName,''), @UserFullName = ISNULL(@UserFullName,'')
    if (@CuisineId = (select c.CuisineId from Cuisine c where c.CuisineName = 'Zero Calorie')) and @CalorieCount > 0
        begin
            select @Return = 1, @Message = 'If the Cuisine Type is Zero Calorie the number of calories must be zero.'
            goto Finished
        end
    if @RecipeId = 0
        begin
            insert Recipe(CreatedByUserId, CuisineId, RecipeName, CalorieCount, DateDrafted, DatePublished, DateArchived)
            values(@CreatedByUserId, @CuisineId, @RecipeName, @CalorieCount, @DateDrafted, @DatePublished, @DateArchived)

            select @RecipeId = scope_identity()
            select @RecipeCode = (select r.RecipeCode from Recipe r where r.RecipeId = @RecipeId)
        end
    else
        begin
            if @RecipeCode <> (select r.RecipeCode from Recipe r where r.RecipeId = @RecipeId)
                begin
                    select @Return = 1, @Message = 'You cannot change the code of a recipe.'
                    goto Finished
                end
            update r 
            set
                CreatedByUserId = @CreatedByUserId,
                CuisineId = @CuisineId,
                RecipeName = @RecipeName,
                CalorieCount = @CalorieCount,
                DateDrafted = @DateDrafted,
                DatePublished = @DatePublished,
                DateArchived = @DateArchived
            from Recipe r 
            where r.RecipeId = @RecipeId
        end
    select @TotalIngredients = COUNT(distinct ri.IngredientId) from Recipe r join RecipeIngredient ri on r.RecipeId = ri.RecipeId where ri.RecipeId = @RecipeId group by ri.RecipeId
    select @TotalSteps = COUNT(distinct rs.SequenceNum) from Recipe r join RecipeStep rs on r.RecipeId = rs.RecipeId where rs.RecipeId = @RecipeId group by rs.RecipeId
    select @RecipeStatus = r.RecipeStatus from Recipe r where r.RecipeId = @RecipeId
    select @CuisineName = c.CuisineName from Cuisine c join Recipe r on c.CuisineId = r.CuisineId where r.RecipeId = @RecipeId
    select @UserFullName = u.UserFullName from Users u join Recipe r on u.UserId = r.CreatedByUserId where r.RecipeId = @RecipeId
        Finished:
        return @Return
end
go

select * from users

select * from recipe r order by r.RecipeId desc 