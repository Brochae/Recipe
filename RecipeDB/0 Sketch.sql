/*
-AS Great job!! 100%
Users
    UserId pk int not null
    UserFirstName varchar 35 not null or blank
    UserLastName varchar 35 not null or blank
    UserPassword varchar 50 not null or blank
        UserFirstName + UserLastName + UserPassword unique

MeasurementType
    MeasurementTypeId pk int not null
    MeasurementTypeName varchar 30 not null or blank, unique

Cuisine 
    Cuisine Id pk int not null
    CuisineName varchar 50 not null or blank, unique

Ingredient
    IngredientId pk int not null
    IngredientName varchar 50 not null or blank, unique

Recipe
    RecipeId pk int not null
    CreatedByUserId fk not null
    CusineId fk not null
    RecipeName varchar 80 not null or blank, unique
    CalorieCount int not null or negative
    DateDrafted date not null default get date, between date website was created and current date
    DatePublished date null
        constraint: DatePublished must between DateDrafted and current date
    DateArchived date null
        constraint: DateArchived must be between DateDrafted or, where relevant, DatePublished and the current date or null
    RecipeStatus as case when DatePublished and DateArchived are null then 'Draft'
                         when DatePublished is not null and DateArchived is null then 'Published'
                         when DateArchived is not null then 'Archived'

RecipeIngredient
    RecipeIngredientId pk int not null
    RecipeId fk not null
    IngredientId fk not null
        RecipeId + IngredientId unique
    MeasurementTypeId fk not null
    Amount decimal 4,2 null, greater than 0 or null
    SequenceNum int not null, greater than 0

RecipeStep
    RecipeStepId pk int not null
    RecipeId fk not null
    SequenceNum int not null, greater than 0
        RecipeId + SequenceNum unique
    StepDesc varchar 750 not null or blank

Meal
    MealId pk int not null
    CreatedByUserId fk not null
    MealTitle varchar 50 not null or blank, unique
    DateCreated date not null default get date
        constraint: DateCreated must be between creation of website (January 1, 2000) and current date.
    Active bit not null default active (1)
    MealStatus as case active when 0 then 'Inactive' when 1 then 'Active'

Course
    CourseId pk int not null
    CourseName varchar 20 not null or blank, unique
    SequenceNum int not null, greater than 0, unique  

MealCourse
    MealCourseId pk int not null
    MealId fk not null
    CourseId fk not null
        MealId + CourseId unique

RecipeMealCourse
    RecipeMealCourseId pk int not null
    RecipeId fk not null
    MealCourseId fk not null
        RecipeId + MealCourseId unique
    Main bit not null default main (1)
    DishTypeDesc as case when 0 then 'side'
                         when 1 then 'main'

Cookbook
    CookbookId pk int not null
    CreatedByUserId fk not null
    CookbookTitle varchar 300 not null or blank, unique
    Price decimal 5,2 not null, greater than 0
    Active bit not null default active (1)
    CookbookStatus as case active when 0 then 'Inactive' when 1 then 'Active'
    DateCreated date not null default get date
        constraint: DateCreated must be between creation of website (January 1, 2000) and current date.

CookbookRecipe
	CookbookRecipeId pk int not null
	CookbookId fk not null
 	RecipeId fk not null, unique
	SequenceNum int not null, greater than 0, unique

*/