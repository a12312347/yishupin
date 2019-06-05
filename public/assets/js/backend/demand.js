define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'demand/index' + location.search,
                    add_url: 'demand/add',
                    edit_url: 'demand/edit',
                    del_url: 'demand/del',
                    multi_url: 'demand/multi',
                    table: 'demand',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'demand_id',
                sortName: 'demand_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'demand_id', title: __('Demand_id')},
                        {field: 'user_id', title: __('User_id')},
                        {field: 'mobile', title: __('Mobile')},
                        {field: 'type', title: __('Type')},
                        {field: 'category', title: __('Category')},
                        {field: 'style', title: __('Style')},
                        {field: 'technique', title: __('Technique')},
                        {field: 'user.avatar', title: __('User.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'artist_id', title: __('Artist_id')},
                        {field: 'artist.name', title: __('Artist.name')},
                        {field: 'artist.avatar', title: __('Artist.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
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