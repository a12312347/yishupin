define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'type/index' + location.search,
                    add_url: 'type/add',
                    add_down_url: 'type/add_down',
                    edit_url: 'type/edit',
                    del_url: 'type/del',
                    multi_url: 'type/multi',
                    table: 'type',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'type_id',
                sortName: 'type_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'type_id', title: __('Type_id')},
                        {field: 'name', title: __('Name')},
                        {field: 'image', title: __('Image'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'pid', title: __('Pid')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,buttons:[
                            {
                                name:'add_down',
                                title:'添加下级分类',
                                icon:'fa fa-plus',
                                classname:'btn-xs btn  btn-primary btn-dialog',
                                url:'type/add_down?pid={row.type_id}'
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
        add_down: function () {
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