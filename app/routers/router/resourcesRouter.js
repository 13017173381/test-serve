
const Router = require('koa-router');
const resourcesController = require('../../controllers/resourcesController')

let resourcesRouter = new Router();

resourcesRouter
  .post('/resources/slideshow', resourcesController.slideshow)

module.exports = resourcesRouter;