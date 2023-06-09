$(function () {
    var totalPage = $('span#totalPage').text();
    var a = parseInt(totalPage);
    var condition = $('#exampleInputName2').val();
    if(a > 0) {
        $('#pagination-demo').twbsPagination({
            totalPages: a,
            visiblePages: 3,
            first: '第一页',
            prev: "<<",
            next: '>>',
            last: '最后一页',
            onPageClick: function (event, page) {
                event.preventDefault();
                $.ajax({
                    type: 'get',
                    url: '/position/manager/findByPage',
                    data: {
                        pageIndex: page,
                        condition: condition
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.status == 1) {
                            var str = "";
                            var position = data.data;
                            for (var i = 0; i < position.list.length; i++) {
                                console.log(position.list[i]);
                                var type = "";
                                if (position.list[i].flag == 1) {
                                    type = "社会兼职";
                                } else {
                                    type = "校园兼职";
                                }
                                str += "<li>\n" +
                                    "<span>" + (1 + i) + "</span>\n" +
                                    "<span>" + position.list[i].pClassify + "</span>\n" +
                                    "<span>" + position.list[i].pDepartment + "</span>\n" +
                                    "<span>" + position.list[i].pName + "</span>\n" +
                                    "<span>" + type + "</span>\n" +
                                    "<span style='display: none;'>" + position.list[i].id + "</span>" +
                                    "<span>\n" +
                                    " <button href=\"#\" class=\"btn btn-primary updateModel\">修改</button>\n" +
                                    "<a href=\"javaScript:void(0);\" class=\"btn btn-danger deleteBtn\">删除</a>\n" +
                                    " </span>\n" +
                                    "</li>";
                            }
                            var trNode = $('#ulContainer');
                            trNode.html(str);
                            var script = document.createElement("script");
                            /*script.src = "../../static/js/manager/position.js";
                            document.body.appendChild(script);
                            script = document.createElement("script");
                            script.src = "../../static/js/manager/positionPage.js";
                            document.body.appendChild(script);*/
                        } else {
                            swal(data.msg, "", "error");
                        }
                    },
                    error: function () {
                        swal('出现错误', "", "error");
                    }
                });
            }
        });
    }
    initDepartment();
    initClasify();
})
function initDepartment(){
    $.ajax({
        type: 'get',
        url: '/department/manager/findByPage',
        dataType: 'json',
        success: function (data) {
            if (data.status == 1) {
                var str = "";
                var department = data.data;
                for (var i = 0; i < department.list.length; i++) {
                    console.log(department.list[i]);
                    str = str +  "<option>"+ department.list[i].name+"</option>";
                }
                var trNode = $('#updateDepartment');
                var adNode = $('#addDepartment');
                trNode.html(str);
                adNode.html(str);
            } else {
                swal(data.msg, "", "error");
            }
        },
        error: function () {
            swal('出现错误', "", "error");
        }
    });
}

function initClasify(){
    $.ajax({
        type: 'get',
        url: '/job/manager/findByPage',
        dataType: 'json',
        success: function (data) {
            if (data.status == 1) {
                var str = "";
                var department = data.data;
                for (var i = 0; i < department.list.length; i++) {
                    console.log(department.list[i]);
                    str = str +  "<option>"+ department.list[i].name+"</option>";
                }
                var trNode = $('#updateClassify');
                var adNode = $('#addClassify');
                trNode.html(str);
                adNode.html(str);
            } else {
                swal(data.msg, "", "error");
            }
        },
        error: function () {
            swal('出现错误', "", "error");
        }
    });
}

