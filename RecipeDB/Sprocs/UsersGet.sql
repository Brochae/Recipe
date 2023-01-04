create or alter procedure UsersGet(
    @UserId int = 0,
    @UserFirstName varchar(35) = '',
    @UserLastName varchar(35) = '',
    @UserPassword varchar(50) = '',
    @All bit = 0,
    @IncludeBlank bit = 0,
    @Message varchar(1000) = '' output
)
as
begin
    declare @Return int
        select 
            @UserId = ISNULL(@UserId,0), 
            @UserFirstName = ISNULL(@UserFirstName,''), 
            @UserLastName = ISNULL(@UserLastName,''), 
            @UserPassword = ISNULL(@UserPassword,''), 
            @All = ISNULL(@All,0), 
            @IncludeBlank = ISNULL(@IncludeBlank,0)

        select u.UserId, u.UserFirstName, u.UserLastName, u.UserPassword, u.UserFullName
        from Users u 
        where u.UserId = @UserId
            or @All = 1
        union select 0, '', '', '','' where @IncludeBlank = 1
        order by u.UserLastName
    return @Return
end

go

exec UsersGet @All = 1
exec UsersGet @All = 1, @IncludeBlank = 1
exec UsersGet @UserId = 2
