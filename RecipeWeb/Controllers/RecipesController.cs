using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using RecipeBizObjects;
using System.Data;

namespace RecipeWeb.Controllers
{
    public class RecipesController : Controller
    {
        public IActionResult Index()
        {
            List<bizRecipe> lst = bizRecipe.GetAll();
            return View(lst);
        }

        [EnableCors("Policy1")]
        public IActionResult APIRecipeList()
        {
            List<bizRecipe> lst = bizRecipe.GetAll();
            return Json(lst);
        }
        [EnableCors("Policy1")]
        public IActionResult APICuisineList()
        {
            List<bizCuisine> lst = bizCuisine.GetAll();
            return Json(lst);
        }

        public IActionResult RecipeDetails(string id)
        {
            bizRecipe r = bizRecipe.Get("RecipeCode", id);
            return View(r);
        }
        public ActionResult Edit(string id)
        {
            bizRecipe r;
            if (string.IsNullOrEmpty(id))
            {
                r = new();
            }
            else
            {
                r = bizRecipe.Get("RecipeCode", id);
            }
            return View(r);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(bizRecipe recipeobj)
        {
            try
            {
                recipeobj.Save();
                return RedirectToAction(nameof(Index));
            }
            catch (CPUFramework.CPUException ex)
            {
                recipeobj = bizRecipe.Get(recipeobj.RecipeId);
                ViewBag.ErrorMessage = ex.FriendlyMessage;
                return View(recipeobj);
            }
        }
        public ActionResult Delete(string id)
        {
            bizRecipe r = bizRecipe.Get("RecipeCode", id);
            return View(r);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(bizRecipe r)
        {
            try
            {
                r.Delete();
                return RedirectToAction(nameof(Index));
            }
            catch (CPUFramework.CPUException ex)
            {
                r = bizRecipe.Get(r.RecipeId);
                ViewBag.ErrorMessage = ex.FriendlyMessage;
                return View(r);
            }
        }
    }
}
