﻿﻿﻿﻿﻿﻿﻿﻿<%-- 
    Document   : new
    Created on : 2012-12-30, 15:19:35
    Author     : alan
--%>
<%@ page session="false" %>
<%@ include file="/WEB-INF/commons/taglibs.jsp" %>



<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add</title>
        <link href="<c:url value="/resources/css/base.css" />" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<c:url value="/resources/javascripts/base.js" />" ></script>
    </head>
    <body>
        <%-- 查询表单  begin --%>     
        <form method="get" style="display: inline;"  >
            <div class="queryPanel">
                <fieldset>
                    <legend>搜索</legend>
                    <table>
                        <tr>	
                            <td class="tdLabel">名字</td>		
                            <td>
                                <input value="" id="name" name="name" maxlength="255"  class=""/>
                            </td>
                            <td class="tdLabel">年龄</td>		
                            <td>
                                <input value="" id="age" name="age" maxlength="10"   />
                            </td>
                        </tr>	
                    </table>
                </fieldset>
                <div class="handleControl">
                    <input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/account/index'"/>
                    <input type="button" class="stdButton" style="width:80px" value="新增" onclick="window.location = '${ctx}/account/new'"/>
                    <input type="button" class="stdButton" style="width:80px" value="删除" onclick="doRestBatchDelete('${ctx}/account/batchDelete','items',document.forms.ec)"/>

                </div>
            </div>
        </form>
        <%-- 查询表单  end --%>    
        <form  id="ec" style="display: inline;"  > 
            <%-- 结果集  begin --%>            
            <ec:table items='page.result' var="item" method="get" 
                      retrieveRowsCallback="limit" sortRowsCallback="limit" filterRowsCallback="limit"
                      action="${ctx}/account/index" autoIncludeParameters="true">  
                <ec:row>
                    <ec:column property="选择" title="<input type='checkbox' onclick=\"setAllCheckboxState('items',this.checked)\" >" sortable="false" width="3%" viewsAllowed="html">
                        <input type="checkbox" name="items" value="${item.id}"/>
                    </ec:column>
                    <ec:column property="id" sortable="false"  title="编号"/>
                    <ec:column property="name"   title="名字"/>
                    <ec:column property="age"  title="密码"/>
                    <ec:column property="操作" title="操作" sortable="false" viewsAllowed="html">
                        <a href="${ctx}/account/${item.id}/delete" onclick="doRestDelete(this,'你确认删除?');return false;">删除</a>
                    </ec:column>
                </ec:row>
            </ec:table>
        </form>
        <%-- 结果集  end --%>     

    </body>
</html>