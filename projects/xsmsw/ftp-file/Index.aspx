<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Index" %>

<%@ Register Src="~/WebControl/PageTop.ascx" TagPrefix="uc1" TagName="PageTop" %>
<%@ Register Src="~/WebControl/PageBottom.ascx" TagPrefix="uc1" TagName="PageBottom" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <title>象山民宿首页</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="css/jquery-ui.min.css" />
    <link rel="stylesheet" href="css/base.css" />
    <link rel="stylesheet" href="css/index.css" />
</head>
<body>
    <form id="form1" runat="server">
        <uc1:PageTop runat="server" ID="PageTop1" />
        <div class="banner2">
            <div class="banner_logo">
                <img src="images/banner_logo.png" alt="">
            </div>
            <!-- 条件筛选start -->
            <section class="condition_select">
                <div class="container">
                    <div class="condition_select_wrap">
                        <div class="area_select_wrap">
                            <input type="text" class="area_select" id="area_select" name="area_select" placeholder="选择区域">
                        </div>
                        <div class="checkin_time_wrap">
                            <input type="text" class="checkin_time" id="checkin_time" name="checkin_time" placeholder="选择入住时间">
                            <div class="date_sign2">
                                <img src="images/date_sign.png" alt=""></div>
                        </div>
                        <div class="checkout_time_wrap">
                            <input type="text" class="checkout_time" id="checkout_time" name="checkout_time" placeholder="选择离开时间" onclick="checkdate1()" onchange="checkdate2()">
                            <div class="date_sign2">
                                <img src="images/date_sign.png" alt=""></div>
                        </div>
                        <div class="search_btn1" onclick="search();">搜索</div>
                    </div>
                </div>
            </section>
            <!-- 条件筛选end -->
        </div>
        <!-- 头部end -->
        
        <!-- 内容区begin -->
        <section class="content clearfix">
            <article class="minsu_summary clearfix">
                    <header class="article_head">
                        <div class="line_wrap clearfix">
                            <div class="de_line"></div>
                                <div class="article_title" style="float:left;margin-left:5%;margin-right:5%;width:40%;">
                                    <a href="thisweek_special.aspx">民宿概览</a></div>
                            <div class="de_line"></div>
                        </div>
                    </header>
                    <section style="padding: 0 20px;">
                        <div class="summary_li_wrap">
                            <a href="Special_Homestay.aspx">
                                <div class="summary_li summary_li1">
                                    特色民宿
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Thisweek_Special.aspx">
                                <div class="summary_li summary_li2">
                                    本周特惠
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Thisweek_Special.aspx">
                                <div class="summary_li summary_li3">
                                    精品推荐
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Made_Trip.aspx">
                                <div class="summary_li summary_li4">
                                    定制旅游
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Groups.aspx">
                                <div class="summary_li summary_li5">
                                    民宿部落
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Spots.aspx">
                                <div class="summary_li summary_li6">
                                    象山景点
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Foods.aspx">
                                <div class="summary_li summary_li7">
                                    象山美食
                                </div>
                            </a>
                        </div>
                        <div class="summary_li_wrap">
                            <a href="Special_Homestay.aspx">
                                <div class="summary_li summary_li8">
                                    更多
                                </div>
                            </a>
                        </div>
                    </section>
                </article>
            <div class="container">
                <!-- 图片列表1begin -->
                <article class="discount clearfix">
                    <header class="article_head">
                        <div class="article_title"><a href="thisweek_special.aspx">本周特惠</a></div>
                        <div class="article_detail">相关描述相关描述</div>
                    </header>
                    <section>
                        <%
                            int result1 = 0;
                            Model.HouseInfo entWeekSel = new Model.HouseInfo();
                            List<Model.HouseInfo> weekList = DAL.HouseInfo.Select(3, 1, entWeekSel, ref result1);
                             %>

                        <%
                            if (weekList.Count > 0)
                            {
                             %>
                        <div class="img_big">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= weekList[0].Id %>">
                                        <img src="<%= weekList[0].Img %>" alt=""></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= weekList[0].Id %>"><%= weekList[0].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= weekList[0].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                        <%
                            if (weekList.Count > 1)
                            {
                             %>
                        <div class="img_small">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= weekList[1].Id %>">
                                        <img src="<%= weekList[1].Img %>" alt=""></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= weekList[1].Id %>"><%= weekList[1].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= weekList[1].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                        <%
                            if (weekList.Count > 2)
                            {
                             %>
                        <div class="img_small">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= weekList[2].Id %>">
                                        <img src="<%= weekList[2].Img %>" alt=""></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= weekList[2].Id %>"><%= weekList[2].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= weekList[2].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                    </section>
                    <div class="look_more_wrap">
                        <div class="look_more">
                            <div class="tri_border"></div>
                            <a href="thisweek_special.aspx">查看更多<p class="mgt10 mglf1">+</p></a>
                        </div>
                    </div>
                </article>
            </div>
            <!-- 图片列表end -->
            <!-- 图片列表2begin -->
            <article class="special_house clearfix">
                <div class="container">
                    <header class="article_head" style="margin-top: 8px;">
                        <div class="article_title"><a href="special_homestay.aspx">特色民宿</a></div>
                        <div class="article_detail">相关描述相关描述</div>
                    </header>
                    <section>
                        <ul class="special_house_ul">                            
                        <%
                            int result2 = 0;
                            Model.HouseInfo entSpecialSel = new Model.HouseInfo();
                            List<Model.HouseInfo> specialList = DAL.HouseInfo.Select(4, 1, entSpecialSel, ref result2);
                            foreach(Model.HouseInfo ent in specialList)
                            {
                             %>
                            <li>
                                <div class="img_wrap">
                                    <div class="recommend_img">
                                        <a href="Special_Homestay_Details.aspx?id=<%= ent.Id %>">
                                            <img src="<%= ent.Img %>" alt="特色民宿" width="217px" height="145px"></a>
                                    </div>
                                    <div class="recommend_title">
                                        <a href="Special_Homestay_Details.aspx?id=<%= ent.Id %>"><%= ent.JianJie %></a>
                                    </div>
                                </div>
                            </li>
                            <%
                                }
                                 %>
                        </ul>
                    </section>
                </div>
            </article>
            <!-- 图片列表end -->
            <!-- 图片列表3begin -->
            <div class="container">
                <article class="discount clearfix">
                    <header class="article_head">
                        <div class="article_title"><a href="thisweek_special.aspx">精品推荐</a></div>
                        <div class="article_detail">相关描述相关描述</div>
                    </header>
                    <section>
                        <%
                            int result3 = 0;
                            Model.HouseInfo entJingSel = new Model.HouseInfo();
                            List<Model.HouseInfo> jingList = DAL.HouseInfo.Select(5, 1, entJingSel, ref result3);
                             %>
                        <%
                            if (jingList.Count > 0)
                            {
                             %>
                        <div class="img_big1">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[0].Id %>">
                                        <img src="<%= jingList[0].Img %>" alt="精品推荐" width="613px" height="270px"></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[0].Id %>"><%= jingList[0].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= jingList[0].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                        <%
                            if (jingList.Count > 1)
                            {
                             %>
                        <div class="img_small1">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[1].Id %>">
                                        <img src="<%= jingList[1].Img %>" alt="精品推荐" width="302px" height="270px"></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[1].Id %>"><%= jingList[1].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= jingList[1].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                        <%
                            if (jingList.Count > 2)
                            {
                             %>
                        <div class="img_small1">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[2].Id %>">
                                        <img src="<%= jingList[2].Img %>" alt="精品推荐" width="302px" height="270px"></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[2].Id %>"><%= jingList[2].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= jingList[2].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                        <%
                            if (jingList.Count > 3)
                            {
                             %>
                        <div class="img_small1">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[3].Id %>">
                                        <img src="<%= jingList[3].Img %>" alt="精品推荐" width="302px" height="270px"></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[3].Id %>"><%= jingList[3].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= jingList[3].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                        <%
                            if (jingList.Count > 4)
                            {
                             %>
                        <div class="img_small1">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[4].Id %>">
                                        <img src="<%= jingList[4].Img %>" alt="精品推荐" width="302px" height="270px"></a>
                                </div>
                                <div class="recommend_title">
                                    <a href="Thisweek_Special.aspx?id=<%= jingList[4].Id %>"><%= jingList[4].JianJie %></a>
                                    <span class="money_word pc_hide">
                                        <span class="money_sign1">¥</span><%= jingList[4].Price %></span>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                             %>
                    </section>
                    <div class="look_more_wrap">
                        <div class="look_more">
                            <div class="tri_border"></div>
                            <a href="thisweek_special.aspx">查看更多<p class="mgt10 mglf1">+</p>
                            </a></div>
                    </div>
                </article>
                <!-- 图片列表end -->
                <!-- 定制游begin -->
                <article class="clearfix">
                    <a href="made_trip.aspx">
                        <div class="made_trip clearfix">
                            <div class="made_trip_title">
                                <img src="images/dingzhiyou.png" alt="">
                            </div>
                            <p>相关描述相关描述</p>
                        </div>
                    </a>
                </article>
                <!-- 定制游end -->
                <!-- 图片列表4begin -->
                <article class="spot clearfix">
                    <header class="article_head">
                        <div class="article_title"><a href="Spots.aspx">象山景点</a></div>
                        <div class="article_detail">相关描述相关描述</div>
                    </header>
                    <section>
                        <ul class="recommend_ul">
                            <%
                                int result4 = 0;
                                Model.JingDian entJDSel = new Model.JingDian();
                                List<Model.JingDian> jdList = DAL.JingDian.Select(3, 1, entJDSel, ref result4);
                                foreach (Model.JingDian ent in jdList)
                                {
                                 %>
                            <li class="nomb">
                                <div class="img_wrap">
                                    <div class="recommend_img">
                                        <a href="SpotDetails.aspx?id=<%= ent.Id %>">
                                            <img src="images/li_img.png" alt="象山景点" width="296px" height="195px"></a>
                                    </div>
                                    <div class="recommend_title">
                                        <a href="SpotDetails.aspx?id=<%= ent.Id %>"><%= ent.Title %></a>
                                    </div>
                                </div>
                                <p class="recommend_reason">推荐理由:<%= ent.TitleFu %></p>
                            </li>
                            <%
                                }
                                 %>
                        </ul>
                        <div class="look_more_wrap">
                            <div class="look_more">
                                <div class="tri_border"></div>
                                <a href="Spots.aspx">查看更多<p class="mgt10 mglf1">+</p>
                                </a></div>
                        </div>
                    </section>
                </article>
                <!-- 图片列表end -->
                <!-- 图片列表5begin -->
                <article class="mgt30 clearfix">
                    <header class="article_head">
                        <div class="article_title"><a href="Foods.aspx">象山美食</a></div>
                        <div class="article_detail">相关描述相关描述</div>
                    </header>
                    <section class="clearfix">
                        <ul class="food_ul">
                            <%
                                int result5 = 0;
                                Model.MeiShi entMSSel = new Model.MeiShi();
                                List<Model.MeiShi> msList = DAL.MeiShi.Select(4, 1, entMSSel, ref result5);
                                foreach (Model.MeiShi ent in msList)
                                {
                                 %>
                            <li>
                                <div class="img_wrap">
                                    <div class="recommend_img">
                                        <a href="FoodDetails.aspx?id=<%= ent.Id %>">
                                            <img src="<%= ent.Img %>" alt="象山美食" width="472px" height="315px"></a>
                                    </div>
                                    <div class="recommend_title food_title">
                                        <a href="FoodDetails.aspx?id=<%= ent.Id %>"><%= ent.Title %></a>
                                        <p class="food_sub_title"><%= ent.TitleFu %></p>
                                    </div>
                                </div>
                            </li>
                            <%
                                }
                                 %>
                        </ul>
                        <div class="look_more_wrap">
                            <div class="look_more">
                                <div class="tri_border"></div>
                                <a href="Foods.aspx">查看更多<p class="mgt10 mglf1">+</p>
                                </a></div>
                        </div>
                    </section>
                </article>
            </div>
            <!-- 图片列表end -->
            <!-- 民宿视频begin -->
            <article class="recommend clearfix">
                <header class="article_head">
                    <div class="article_title">民宿视频</div>
                    <div class="article_detail">相关描述相关描述</div>
                </header>
                <ul class="movie_ul">
                    <li>
                        <div class="img_wrap">
                            <div class="recommend_img">
                                <img src="images/li_img.png" alt="民宿视频" width="674px" height="444px">
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="img_wrap">
                            <div class="recommend_img">
                                <img src="images/li_img.png" alt="民宿视频" width="674px" height="444px">
                            </div>
                        </div>
                    </li>
                </ul>
            </article>
            <!-- 民宿视频end -->
            </div>
			<!-- 民宿部落begin -->
            <article class="recommend clearfix" style="margin-top: -3px;">
                <div class="container">
                    <header class="article_head">
                        <div class="article_title"><a href="Groups.aspx">民宿部落</a></div>
                        <div class="article_detail">相关描述相关描述</div>
                    </header>
                    <ul class="recommend_ul">
                            <%
                                int result6 = 0;
                                Model.BuLuo entBLSel = new Model.BuLuo();
                                List<Model.BuLuo> blList = DAL.BuLuo.Select(6, 1, entBLSel, ref result6);
                                foreach (Model.BuLuo ent in blList)
                                {
                                 %>
                        <li class="group_li">
                            <div class="img_wrap">
                                <div class="recommend_img">
                                    <a href="GroupDetails.aspx?id=<%= ent.Id %>">
                                        <img src="<%= ent.Img %>" alt="民宿部落" width="295px" height="195px"></a>
                                </div>
                                <div class="recommend_title group_title">
                                    <a href="GroupDetails.aspx?id=<%= ent.Id %>"><%= ent.Title %></a>
                                    <p>
                                        <span class="publish_date"><%= ent.AddDate.ToShortDateString() %></span>
                                        <span class="function_li">
                                            <img src="images/message_icon.png" alt="" width="17px" height="15px"><span class="message_num">0</span>
                                        </span>
                                        <span class="function_li">
                                            <img src="images/eye_icon.png" alt="" width="17px" height="15px"><span class="browse_num"><%= ent.Click %></span>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                             %>
                    </ul>
                </div>
                <div class="look_more_wrap">
                    <div class="look_more">
                        <div class="tri_border"></div>
                        <a href="Groups.aspx">查看更多<p class="mgt10 mglf1">+</p>
                        </a></div>
                </div>
            </article>
            <!-- 民宿部落begin -->
        </section>
        <!-- 内容区end -->
        <!-- 底部版权区begin -->
        <uc1:PageBottom runat="server" ID="PageBottom1" />
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script>
            $('.collapse_btn').click(function (event) {
                $('.head_nav').slideToggle();
            });
            $("#checkin_time").datepicker();
            $("#checkin_time").datepicker("option", "showAnim", "blind");
            $("#checkout_time").datepicker();
            $("#checkout_time").datepicker("option", "showAnim", "blind");
            function checkdate1() {
                var date1 = document.getElementById('checkin_time').value;
                if (date1 == "") {
                    alert('请先选择入住时间！');
                    document.getElementById('checkout_time').value = "";
                }
            }
            function checkdate2() {
                var date1 = document.getElementById('checkin_time').value;
                var date2 = document.getElementById('checkout_time').value;
                if (date1 == "") {
                    alert('请先选择离开时间！');
                    document.getElementById('checkout_time').value = "";
                }
                if (date1 > date2) {
                    alert('离开时间不得小于入住时间！');
                    document.getElementById('checkout_time').value = "";
                }
            }
            window.onload = function () {
                $('.register_box').eq(0).hide();
            }
            $('.register_select_ul li').click(function () {
                var index = $(this).index();
                $(this).addClass('active').siblings().removeClass('active');
                $('.register_box').eq(index).show().siblings().hide();
            })
            $('.close_btn').click(function () {
                $(this).parents('.alert_wrap').fadeOut();
            })
            $('.forget_btn').click(function () {
                $(this).parents('.alert_wrap').fadeOut();
                $('.findpass_wrap').fadeIn();
            })
            $('.login_btn1').click(function () {
                $('.login_wrap').fadeIn();
            })
        </script>
        <script type="text/javascript">
            function search() {
                var area = $("#area_select").val();
                var date1 = $("#checkin_time").val();
                var date2 = $("#checkout_time").val();
                if (area == "")
                {
                    alert("请选择区域！");
                }
                else if (date1 == "")
                {
                    alert("请选择入驻时间！");
                }
                else if (date2 == "") {
                    alert("请选择离开时间！");
                }
                else {
                    location.href = 'Special_Homestay.aspx?a=' + area + "&b=" + date1 + "&c=" + date2;
                }
            }
        </script>
    </form>
</body>
</html>