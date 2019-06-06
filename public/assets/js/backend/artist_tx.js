define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'artist_tx/index' + location.search,
                    add_url: 'artist_tx/add',
                    //edit_url: 'artist_tx/edit',
                    //del_url: 'artist_tx/del',
                    multi_url: 'artist_tx/multi',
                    table: 'tx',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'tx_id',
                sortName: 'tx_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'tx_id', title: __('Tx_id')},
                        {field: 'artist_id', title: __('Artist_id')},
                        {field: 'account', title: __('Account')},
                        {field: 'type', title: __('Type'), searchList: {"10":__('Type 10'),"20":__('Type 20')}, formatter: Table.api.formatter.status},
                        {field: 'tx_price', title: __('Tx_price'), operate:'BETWEEN'},
                        {field: 'sj_price', title: __('Sj_price'), operate:'BETWEEN'},
                        {field: 'status', title: __('Status'), searchList: {"10":__('Status 10'),"20":__('Status 20'),"30":__('Status 30')}, formatter: Table.api.formatter.status},
                        {field:'createtime',title:__('创建时间')},
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