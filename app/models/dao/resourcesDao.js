
const db = require('./db.js');

module.exports = {
  // 连接数据库获取轮播图数据
  slideshows: async () => {
    const sql = 'select * from slideshow';
    return await db.query(sql, []);
  }
}