(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-5ee8a709"],{"2ec1":function(t,s,r){},"696b":function(t,s,r){"use strict";r("2ec1")},cf2a:function(t,s,r){"use strict";r.r(s);var a=function(){var t=this,s=t._self._c;return s("div",{staticClass:"order"},[t._m(0),t.orders.length>0?s("div",{staticClass:"order-content"},[t._l(t.orders,(function(r,a){return s("div",{key:a,staticClass:"content"},[s("ul",[s("li",{staticClass:"order-info"},[s("div",{staticClass:"order-id"},[t._v("订单编号: "+t._s(r[0].order_id))]),s("div",{staticClass:"order-time"},[t._v("订单时间: "+t._s(t._f("dateFormat")(r[0].order_time)))])]),t._m(1,!0),t._l(r,(function(r,a){return s("li",{key:a,staticClass:"product-list"},[s("div",{staticClass:"pro-img"},[s("router-link",{attrs:{to:{path:"/goods/details",query:{productID:r.product_id}}}},[s("img",{attrs:{src:t.$target+r.product_picture}})])],1),s("div",{staticClass:"pro-name"},[s("router-link",{attrs:{to:{path:"/goods/details",query:{productID:r.product_id}}}},[t._v(t._s(r.product_name))])],1),s("div",{staticClass:"pro-price"},[t._v(t._s(r.product_price)+"元")]),s("div",{staticClass:"pro-num"},[t._v(t._s(r.product_num))]),s("div",{staticClass:"pro-total pro-total-in"},[t._v(t._s(r.product_price*r.product_num)+"元")])])}))],2),s("div",{staticClass:"order-bar"},[s("div",{staticClass:"order-bar-left"},[s("span",{staticClass:"order-total"},[t._v(" 共 "),s("span",{staticClass:"order-total-num"},[t._v(t._s(t.total[a].totalNum))]),t._v(" 件商品 ")])]),s("div",{staticClass:"order-bar-right"},[s("span",[s("span",{staticClass:"total-price-title"},[t._v("合计：")]),s("span",{staticClass:"total-price"},[t._v(t._s(t.total[a].totalPrice)+"元")])])])])])})),s("div",{staticStyle:{"margin-top":"-40px"}})],2):s("div",{staticClass:"order-empty"},[t._m(2)])])},i=[function(){var t=this,s=t._self._c;return s("div",{staticClass:"order-header"},[s("div",{staticClass:"order-header-content"},[s("p",[s("i",{staticClass:"el-icon-s-order",staticStyle:{"font-size":"30px",color:"#ff6700"}}),t._v(" 我的订单 ")])])])},function(){var t=this,s=t._self._c;return s("li",{staticClass:"header"},[s("div",{staticClass:"pro-img"}),s("div",{staticClass:"pro-name"},[t._v("商品名称")]),s("div",{staticClass:"pro-price"},[t._v("单价")]),s("div",{staticClass:"pro-num"},[t._v("数量")]),s("div",{staticClass:"pro-total"},[t._v("小计")])])},function(){var t=this,s=t._self._c;return s("div",{staticClass:"empty"},[s("h2",[t._v("您的订单还是空的！")]),s("p",[t._v("快去购物吧！")])])}],o=(r("d3b7"),r("14d9"),{data:function(){return{orders:[],total:[]}},activated:function(){var t=this;this.$axios.post("/user/order/getOrder",{user_id:this.$store.getters.getUser.user_id}).then((function(s){"001"===s.data.code?t.orders=s.data.orders:t.notifyError(s.data.msg)})).catch((function(t){return Promise.reject(t)}))},watch:{orders:function(t){for(var s=[],r=0;r<t.length;r++){for(var a=t[r],i=0,o=0,e=0;e<a.length;e++){var c=a[e];i+=c.product_num,o+=c.product_price*c.product_num}s.push({totalNum:i,totalPrice:o})}this.total=s}}}),e=o,c=(r("696b"),r("2877")),d=Object(c["a"])(e,a,i,!1,null,"22733f59",null);s["default"]=d.exports}}]);
//# sourceMappingURL=chunk-5ee8a709.f9e2cb8e.js.map