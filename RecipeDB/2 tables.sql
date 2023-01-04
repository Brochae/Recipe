--AS Amazing job! 100%
use RecipeDB
go

drop table if exists CookbookRecipe
drop table if exists Cookbook
drop table if exists RecipeMealCourse
drop table if exists MealCourse
drop table if exists Course
drop table if exists Meal
drop table if exists RecipeStep
drop table if exists RecipeIngredient
drop table if exists Recipe
drop table if exists Ingredient
drop table if exists Cuisine
drop table if exists MeasurementType
drop table if exists Users
go

create table dbo.Users(
    UserId int not null identity primary key,
    UserFirstName varchar(35) not null
        constraint ck_UserFirstName_cannot_be_blank check(UserFirstName <> ''),
    UserLastName varchar(35) not null
        constraint ck_UserLastName_cannot_be_blank check(UserLastName <> ''),
    UserFullName as concat(UserFirstName, ' ', UserLastName),
    UserPassword varchar(50) not null
        constraint ck_UserPassword_cannot_be_blank check(UserPassword <> ''),
        constraint u_User_UserFirstName_UserLastName_UserPassword unique(UserFirstName, UserLastName, UserPassword)
)
go

create table dbo.MeasurementType(
    MeasurementTypeId int not null identity primary key,
    MeasurementTypeName varchar(30) not null 
        constraint u_MeasurementType_MeasurementTypeName unique,
        constraint ck_MeasuremeantTypeName_cannot_be_blank check(MeasurementTypeName <> '')
)
go

create table dbo.Cuisine(
    CuisineId int not null identity primary key,
    CuisineName varchar(50) not null
        constraint u_Cuisine_CuisineName unique,
        constraint ck_CuisineName_cannot_be_blank check(CuisineName <> '')
)
go

create table dbo.Ingredient(
    IngredientId int not null identity primary key,
    IngredientName varchar(50) not null
        constraint u_Inredient_IngredientName unique,
        constraint ck_IngredientName_cannot_be_blank check(IngredientName <> '')
)
go

create table dbo.Recipe(
    RecipeId int not null identity primary key,
    CreatedByUserId int not null constraint f_Users_Recipe foreign key references Users(UserId),
    CuisineId int not null constraint f_Cuisine_Recipe foreign key references Cuisine(CuisineId),
    RecipeName varchar(80) not null 
        constraint u_Recipe_RecipeName unique,
        constraint ck_RecipeName_cannot_be_blank check(RecipeName <> ''),
    CalorieCount int not null
        constraint ck_CalorieCount_must_be_greater_than_or_equal_to_0 check(CalorieCount >= 0),
    DateDrafted datetime2 not null default getdate()
        constraint ck_DateDrafted_must_be_between_January_1st_2000_and_the_current_date check(DateDrafted between '2000-01-01' and getdate()),
    DatePublished datetime2 
        constraint ck_DatePublished_cannot_be_a_future_date check(DatePublished <= getdate()),
    DateArchived datetime2
        constraint ck_DateArchived_cannot_be_a_future_date check(DateArchived <= getdate()),
    RecipeStatus as
            case 
                when DatePublished is null and DateArchived is null then 'Draft'
                when DatePublished is not null and DateArchived is null then 'Published'
                when DateArchived is not null then 'Archived'
            end
        persisted,
        constraint ck_DatePublished_must_be_after_DateDrafted check(DatePublished >= DateDrafted),
        constraint ck_DateArchived_must_be_after_DateDrafted_and_DatePublished_or_null check(DateArchived >= DateDrafted and DateArchived >= DatePublished)
)
go 

create table dbo.RecipeIngredient(
    RecipeIngredientId int not null identity primary key,
    RecipeId int not null constraint f_Recipe_RecipeIngredient foreign key references Recipe(RecipeId),
    IngredientId int not null constraint f_Ingredient_RecipeIngredient foreign key references Ingredient(IngredientId),
    MeasurementTypeId int not null constraint f_MeasurementType_RecipeIngredient foreign key references MeasurementType(MeasurementTypeId),
    Amount decimal(5,2)  
        constraint ck_Amount_must_be_greater_than_0_or_null check((Amount > 0) or (Amount is null)),  
    SequenceNum int not null 
        constraint ck_RecipeIngredient_SequenceNum_must_be_greater_than_0 check(SequenceNum > 0),
        constraint u_RecipeIngredient_RecipeId_IngredientId unique(RecipeId, IngredientId)
)
go

create table dbo.RecipeStep(
    RecipeStepId int not null identity primary key,
    RecipeId int not null constraint f_Recipe_RecipeStep foreign key references Recipe(RecipeId),
    SequenceNum int not null 
        constraint ck_RecipeStep_SequenceNum_must_be_greater_than_0 check(SequenceNum > 0),
    StepDesc varchar(750) not null 
        constraint ck_StepDesc_cannot_be_blank check(StepDesc <> ''),
        constraint u_RecipeStep_RecipeId_SequenceNum unique(RecipeId, SequenceNum)
)
go

create table dbo.Meal(
    MealId int not null identity primary key,
    UserId int not null constraint f_Users_Meal foreign key references Users(UserId),
    MealTitle varchar(50) not null 
        constraint u_Meal_MealTitle unique,
        constraint ck_MealTitle_cannot_be_blank check(MealTitle <> ''),
    DateCreated date not null default getdate()
        constraint ck_Meal_DateCreated_must_be_between_January_1st_2000_and_current_date check(DateCreated between '2000-01-01' and getdate()),
    Active bit not null default 1,
    MealStatus as 
        case Active
            when 0 then 'Inactive'
            when 1 then 'Active'
        end persisted
)
go 

create table dbo.Course(
    CourseId int not null identity primary key,
    CourseName varchar(20) not null
        constraint u_Course_CourseName unique,
        constraint ck_CourseName_cannot_be_blank check(CourseName <> ''),
    SequenceNum int not null 
        constraint u_Course_SequenceNum unique,
        constraint ck_Course_SequenceNum_must_be_greater_than_0 check(SequenceNum > 0)
)
go

create table dbo.MealCourse(
    MealCourseId int not null identity primary key,
    MealId int not null constraint f_Meal_MealCourse foreign key references Meal(MealId),
    CourseId int not null constraint f_Course_MealCourse foreign key references Course(CourseId),
        constraint u_MealCourse_MealId_CourseId unique(MealId, CourseId)
)
go

create table dbo.RecipeMealCourse(
    RecipeMealCourseId int not null identity primary key,
    RecipeId int not null constraint f_Recipe_RecipeMealCourse foreign key references Recipe(RecipeId),
    MealCourseId int not null constraint f_MealCourse_RecipeMealCourse foreign key references MealCourse(MealCourseId),
    Main bit not null default 1,
    DishTypeDesc as
            case Main 
                when 0 then 'Side'
                when 1 then 'Main'
            end
        persisted,
        constraint u_RecipeMealCourse_RecipeId_MealCourseId unique(RecipeId, MealCourseId)
)
go

create table dbo.Cookbook(
    CookbookId int not null identity primary key,
    UserId int not null constraint f_Users_Cookbook foreign key references Users(UserId),
    CookbookTitle varchar(300) not null
        constraint u_Cookbook_CookbookTitle unique,
        constraint ck_CookbookTitle_cannot_be_blank check(CookbookTitle <> ''),
    Price decimal(5,2) not null 
        constraint ck_Price_must_be_greater_than_0 check(Price > 0),
    Active bit not null default 1,
    CookbookStatus as 
        case Active
            when 0 then 'Inactive'
            when 1 then 'Active'
        end,
    DateCreated date not null 
        constraint ck_Cookbook_DateCreated_must_be_between_January_1st_2000_and_current_date check(DateCreated between '2000-01-01' and getdate())
)
go 

create table dbo.CookbookRecipe(
    CookbookRecipeId int not null identity primary key,
    CookbookId int not null constraint f_Users_Cookbook_CookbookRecipe foreign key references Cookbook(CookbookId),
    RecipeId int not null constraint f_Recipe_CookbookRecipe foreign key references Recipe(RecipeId),
    SequenceNum int not null
        constraint ck_CookbookRecipe_SequenceNum_must_be_greater_than_0 check(SequenceNum > 0),
        constraint u_CookbookRecipe_CookbookId_SequenceNum unique(CookbookId, SequenceNum),
        constraint u_CookbookRecipe_CookbookId_RecipeId unique(CookbookId, RecipeId),
)
go

alter table Recipe drop Column if exists RecipeCode

alter table Recipe add RecipeCode varchar(80) not null default ''

go

create or alter trigger dbo.InsertRecipeCode
on Recipe
after insert 
as
begin
update r
set r.RecipeCode = replace(replace(replace(replace(RecipeName, ' ', '-'), '&', 'and'),'''', ''),'--','-') 
from Recipe r
end
go

--replace(replace(replace(replace(RecipeName, ' ', '-'), '&', 'and'),'''', ''),'--','-') from Recipe
