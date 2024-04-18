
const resourcesDao = require('../models/dao/resourcesDao');
module.exports = {
  /**
   * 获取轮播图数据
   * @param {Object} ctx
   */
  slideshow: async ctx => {
    let slideshow = await resourcesDao.slideshows();
    ctx.body = {
      code: '001',
      slideshow
    }
  }
}