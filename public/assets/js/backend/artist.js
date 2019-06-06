define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'artist/index' + location.search,
                    add_url: 'artist/add',
                    edit_url: 'artist/edit',
                    del_url: 'artist/del',
                    multi_url: 'artist/multi',
                    table: 'artist',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'artist_id',
                sortName: 'artist_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'artist_id', title: __('Artist_id')},
                        {field: 'name', title: __('Name')},
                        {field: 'avatar', title: __('Avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'wallet', title: __('Wallet'), operate:'BETWEEN'},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,buttons:[
                            {
                                name:'add_account',
                                title:'添加后台管理账号',
                                icon:'fa fa-plus',
                                classname:'btn btn-xs btn-primary btn-dialog',
                                url:'artist/add_account?artist_id={row.artist_id}'
                            }
                        ]}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        add_account: function () {
            Controller.api.bindevent();
        },
        artist_info: function () {
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