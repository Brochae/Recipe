create or alter procedure CuisineGet(
    @CuisineId int = 0,
    @All bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
    declare @Return int
        select @CuisineId = ISNULL(@CuisineId,0), @All = ISNULL(@All,0), @IncludeBlank = ISNULL(@IncludeBlank,0)
    
        select c.CuisineId, c.CuisineName
        from Cuisine c
        where c.CuisineId = @CuisineId
            or @All = 1
        union select 0, '' where @IncludeBlank = 1
        order by c.CuisineName
    return @Return
end

go

exec CuisineGet @All = 1
exec CuisineGet @All = 1, @IncludeBlank = 1
exec CuisineGet @CuisineId = 2
