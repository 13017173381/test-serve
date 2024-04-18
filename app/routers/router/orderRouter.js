
const Router = require('koa-router');
const orderController = require('../../controllers/orderController')

let orderRouter = new Router();//引入了 koa-router 模块，用于创建和配置路由。

orderRouter
  .post('/user/order/getOrder', orderController.GetOrder)
  .post('/user/order/addOrder', orderController.AddOrder)

module.exports = orderRouter;