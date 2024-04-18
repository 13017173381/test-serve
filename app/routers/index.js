
const Router = require('koa-router');

let Routers = new Router();

const userRouter = require('./router/userRouter');
const resourcesRouter = require('./router/resourcesRouter');
const productRouter = require('./router/productRouter');
const shoppingCartRouter = require('./router/shoppingCartRouter');
const orderRouter = require('./router/orderRouter');

Routers.use(userRouter.routes());
Routers.use(resourcesRouter.routes());
Routers.use(productRouter.routes());
Routers.use(shoppingCartRouter.routes());
Routers.use(orderRouter.routes());
// Routers.use(collectRouter.routes());

module.exports = Routers;

// 创建并配置路由，然后将这些路由挂载到一个主路由实例上，最后将主路由实例导出供应用程序使用。
// koa - router 模块，这是 Koa 框架的一个路由中间件，用于处理 HTTP 请求与路由匹配的功能。
// 创建了一个名为 Routers 的新路由实例
// Routers.use() 方法将各个路由模块的路由配置挂载到主路由实例 Routers 上,可以将各个路由模块的路由整合到一个主路由中，便于统一管理和维护。