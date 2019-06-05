define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'artist_comment/index' + location.search,
                    add_url: 'artist_comment/add',
                    edit_url: 'artist_comment/edit',
                    del_url: 'artist_comment/del',
                    multi_url: 'artist_comment/multi',
                    table: 'artist_comment',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'artist_comment_id',
                sortName: 'artist_comment_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'artist_comment_id', title: __('Artist_comment_id')},
                        {field: 'artist.name', title: __('Artist.name')},
                        {field: 'artist.avatar', title: __('Artist.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
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