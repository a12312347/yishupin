define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'artist_my_demand/index' + location.search,
                    add_url: 'artist_my_demand/add',
                    //edit_url: 'artist_my_demand/edit',
                    //del_url: 'artist_my_demand/del',
                    multi_url: 'artist_my_demand/multi',
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
                        {field: 'user.avatar', title: __('User.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,buttons:[
                            {
                                name:'show_introduce',
                                text:'查看需求',
                                title:'查看需求',
                                extend:'data-area=\'["80%","80%"]\'',
                                classname:'btn-xs btn btn-primary btn-dialog',
                                url:'artist_demand/show_introduce?demand_id={row.demand_id}'
                            },
                            {
                                name:'leave',
                                text:'释放',
                                title:'释放',
                                classname:'btn-xs btn btn-danger btn-ajax',
                                url:'artist_demand/leave?demand_id={row.demand_id}',
                                confirm:'是否确认释放?',
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