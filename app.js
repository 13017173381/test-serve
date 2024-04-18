
const Koa = require('koa');
const KoaStatic = require('koa-static');//这是 Koa 框架的一个中间件，用于提供静态文件服务。它可以帮助处理静态资源文件
const KoaBody = require('koa-body');
//Koa 框架的一个中间件，用于解析请求体中的数据。它可以处理 POST 请求、上传文件等，并将请求体解析为 JavaScript 对象，方便在代码中进行处理。
const Session = require('koa-session');
//这是 Koa 框架的一个中间件，用于处理会话管理。通过在客户端和服务器间存储会话信息来跟踪用户的状态，用于实现用户登录状态的管理、身份验证等功能。
let { Port, staticDir } = require('./config');

let app = new Koa();
// 主要功能是创建一个基于 Koa 的 Web 服务器，
// 并配置了一系列中间件来处理请求、异常、静态资源、用户会话等。路由部分则是通过引入和使用 Routers 模块来实现的。
// 处理异常
const error = require('./app/middleware/error');
app.use(error);

// 为静态资源请求重写url
const rewriteUrl = require('./app/middleware/rewriteUrl');
app.use(rewriteUrl); //使用了一个中间件 rewriteUrl，用于重写静态资源请求的 URL。
// 使用koa-static处理静态资源
app.use(KoaStatic(staticDir));//使用了 koa-static 中间件来处理静态资源请求，并指定了静态资源目录为 staticDir。

// session 配置了 Session 中间件，使用了 koa-session 模块，并设置了一些配置参数。
const CONFIG = require('./app/middleware/session');
app.keys = ['session app keys'];
app.use(Session(CONFIG, app));

// 判断是否登录 使用了一个自定义的中间件 isLogin，用于判断用户是否登录。

const isLogin = require('./app/middleware/isLogin');
app.use(isLogin);
// 添加了一个全局中间件，将用户信息存储在 ctx.state.user 中。
app.use(async (ctx, next) => {
  ctx.state.user = ctx.session.user;
  await next();
});

// 处理请求体数据  使用了 koa-body 中间件来处理请求体数据，传入了一个配置对象 koaBodyConfig。
const koaBodyConfig = require('./app/middleware/koaBodyConfig');
app.use(KoaBody(koaBodyConfig));

// 使用路由中间件 引入了路由模块 Routers，并使用了路由中间件，将其挂载到应用程序上
const Routers = require('./app/routers');
app.use(Routers.routes()).use(Routers.allowedMethods());

// 调用 app.listen() 方法，启动服务器，监听指定的端口 Port。
app.listen(Port, () => {
  console.log(`服务器启动在${ Port }端口`);
});