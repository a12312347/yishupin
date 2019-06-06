define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'artist_demand/index' + location.search,
                    add_url: 'artist_demand/add',
                    //edit_url: 'artist_demand/edit',
                    //del_url: 'artist_demand/del',
                    multi_url: 'artist_demand/multi',
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
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'type', title: __('Type')},
                        {field: 'category', title: __('Category')},
                        {field: 'style', title: __('Style')},
                        {field: 'technique', title: __('Technique')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,buttons:[
                            {
                                name:'show_introduce',
                                text:'查看需求',
                                title:'查看需求',
                                classname:'btn-xs btn btn-primary btn-dialog',
                                url:'artist_demand/show_introduce?demand_id={row.demand_id}'
                            },
                            {
                                name:'access',
                                text:'接单',
                                title:'接单',
                                classname:'btn-xs btn btn-success btn-ajax',
                                url:'artist_demand/access?demand_id={row.demand_id}',
                                confirm:'是否确认接单?',
                                success:function(){
                                    $('.btn-refresh').trigger('click');
                                }
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