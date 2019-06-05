define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'goods/index' + location.search,
                    add_url: 'goods/add',
                    edit_url: 'goods/edit',
                    del_url: 'goods/del',
                    multi_url: 'goods/multi',
                    table: 'goods',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'goods_id',
                sortName: 'goods_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'goods_id', title: __('Goods_id')},
                        {field: 'artist_id', title: __('Artist_id')},

                        {field: 'artist.name', title: __('Artist.name')},
                        {field: 'artist.avatar', title: __('Artist.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'title', title: __('Title')},
                        {field: 'tags', title: __('Tags')},
                        {field: 'size', title: __('Size')},
                        {field: 'year', title: __('Year')},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'image', title: __('Image'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'type', title: __('Type'), searchList: {"10":__('Type 10'),"20":__('Type 20'),"30":__('Type 30')}, formatter: Table.api.formatter.normal},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange'},

                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});


$("#c-type1_id").data("params",function(){
   return {custom:{pid:0}}
});

$("#c-type2_id").data("params",function(){
    return {custom:{pid:$("#c-type1_id").val(),level:2}}
});

$("#c-type3_id").data("params",function(){
    return {custom:{pid:$("#c-type2_id").val(),level:3}}
});