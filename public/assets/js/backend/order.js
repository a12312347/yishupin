define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/index' + location.search,
                    add_url: 'order/add',
                    //edit_url: 'order/edit',
                    del_url: 'order/del',
                    multi_url: 'order/multi',
                    table: 'order',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'order_id',
                sortName: 'order_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'order_id', title: __('Order_id')},
                        {field: 'order_num', title: __('Order_num')},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'receive_name', title: __('Receive_name')},
                        {field: 'receive_mobile', title: __('Receive_mobile')},
                        {field: 'receive_address', title: __('Receive_address')},
                        {field: 'pay_type', title: __('Pay_type'), searchList: {"10":__('Pay_type 10'),"20":__('Pay_type 20')}, formatter: Table.api.formatter.normal},
                        {field: 'out_trade_no', title: __('Out_trade_no')},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'artist.name', title: __('Artist.name')},
                        {field: 'goods.title', title: __('Goods.title')},
                        {field: 'user.avatar', title: __('User.avatar'), events: Table.api.events.image, formatter: Table.api.formatter.image},

                        {field: 'status', title: __('Status'), searchList: {"10":__('Status 10'),"20":__('Status 20'),"30":__('Status 30')}, formatter: Table.api.formatter.status},

                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate,buttons:[
                            {
                                name:'complete',
                                text:'发货',
                                title:'确认发货',
                                icon:'fa fa-check',
                                classname:'btn-xs btn-primary btn btn-warning btn-ajax',
                                url:'order/complete?order_id={row.order_id}',
                                success:function(){
                                    $('.btn-refresh').trigger('click');
                                },
                                visible:function(row){
                                    return row.status==20  ?true:false;
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