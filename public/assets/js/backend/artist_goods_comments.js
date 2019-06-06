define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'artist_goods_comments/index' + location.search,
                    add_url: 'artist_goods_comments/add',
                    edit_url: 'artist_goods_comments/edit',
                    del_url: 'artist_goods_comments/del',
                    multi_url: 'artist_goods_comments/multi',
                    table: 'goods_comments',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'goods_comment_id',
                sortName: 'goods_comment_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'goods_comment_id', title: __('Goods_comment_id')},
                        {field: 'goods_id', title: __('Goods_id')},
                        {field: 'goods.title', title: __('Goods.title')},

                        {field: 'user.avatar', title: __('User.avatar'),formatter:Table.api.formatter.image,events:Table.api.events.image},
                        {field: 'reply', title: __('Reply')},
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