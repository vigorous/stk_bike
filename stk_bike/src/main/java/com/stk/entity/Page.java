package com.stk.entity;

public class Page
{
  private int showCount;
  private int totalPage;
  private int totalResult;
  private int currentPage;
  private int currentResult;
  private boolean entityOrField;
  private String pageStr;

  public Page()
  {
    this.showCount = 10;
  }

  public int getTotalPage() {
    if (this.totalResult % this.showCount == 0)
      this.totalPage = (this.totalResult / this.showCount);
    else
      this.totalPage = (this.totalResult / this.showCount + 1);
    return this.totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public int getTotalResult() {
    return this.totalResult;
  }

  public void setTotalResult(int totalResult) {
    this.totalResult = totalResult;
  }

  public int getCurrentPage() {
    if (this.currentPage <= 0)
      this.currentPage = 1;
    if (this.currentPage > getTotalPage())
      this.currentPage = getTotalPage();
    return this.currentPage;
  }

  public void setCurrentPage(int currentPage) {
    this.currentPage = currentPage;
  }

  public String getPageStr() {
    StringBuffer sb = new StringBuffer();
    if (this.totalResult > 0) {
      sb.append("<style>.pagination ul>li {display: inline;}.pagination ul>li>a:hover {background-color: #eaeff2;}.pagination ul>li>a {color: #2283c5;background-color: #fafafa;margin: 0 -1px 0 0;border-color: #e0e8eb;border-width: 1px;border-radius: 0!important;float: left;padding: 4px 12px;line-height: 20px;text-decoration: none;background-color: #fff;border: 1px solid #ddd;}</style>");

      sb.append("\t<div class='pagination' style='float: right;padding-top: 0px;margin-top: 0px;'><ul>\n");
      if (this.currentPage == 1) {
        sb.append("\t<li><a>共<font color=red>" + this.totalResult + "</font>条</a></li>\n");
        sb.append("\t<li><input type=\"number\" value=\"" + this.currentPage + "\" id=\"toGoPage\" style=\"width:62px;text-align:center;float:left;padding: 4px 6px;line-height: 20px;\" placeholder=\"页码\"/></li>\n");
        sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">跳转</a></li>\n");
        sb.append("\t<li><a>首页</a></li>\n");
        sb.append("\t<li><a>上页</a></li>\n");
      } else {
        sb.append("\t<li><a>共<font color=red>" + this.totalResult + "</font>条</a></li>\n");
        sb.append("\t<li><input type=\"number\" value=\"" + this.currentPage + "\" id=\"toGoPage\" style=\"width:62px;text-align:center;float:left;padding: 4px 6px;line-height: 20px;\" placeholder=\"页码\"/></li>\n");
        sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">跳转</a></li>\n");
        sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"nextPage(1)\">首页</a></li>\n");
        sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"nextPage(" + (this.currentPage - 1) + ")\">上页</a></li>\n");
      }
      int showTag = 5;
      int startTag = 1;
      if (this.currentPage > showTag) {
        startTag = this.currentPage - 1;
      }
      int endTag = startTag + showTag - 1;
      for (int i = startTag; (i <= this.totalPage) && (i <= endTag); i++) {
        if (this.currentPage == i)
          sb.append("<li><a><font color='#808080'>" + i + "</font></a></li>\n");
        else
          sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"nextPage(" + i + ")\">" + i + "</a></li>\n");
      }
      if (this.currentPage == this.totalPage) {
        sb.append("\t<li><a>下页</a></li>\n");
        sb.append("\t<li><a>尾页</a></li>\n");
      } else {
        sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"nextPage(" + (this.currentPage + 1) + ")\">下页</a></li>\n");
        sb.append("\t<li style=\"cursor:pointer;\"><a onclick=\"nextPage(" + this.totalPage + ")\">尾页</a></li>\n");
      }
      sb.append("\t<li><a>第" + this.currentPage + "页</a></li>\n");
      sb.append("\t<li><a>共" + this.totalPage + "页</a></li>\n");

      sb.append("\t<li><select title='显示条数' style=\"width:55px;float:left;\" onchange=\"changeCount(this.value)\">\n");
      sb.append("\t<option value='" + this.showCount + "'>" + this.showCount + "</option>\n");
      sb.append("\t<option value='10'>10</option>\n");
      sb.append("\t<option value='20'>20</option>\n");
      sb.append("\t<option value='30'>30</option>\n");
      sb.append("\t<option value='40'>40</option>\n");
      sb.append("\t<option value='50'>50</option>\n");
      sb.append("\t<option value='60'>60</option>\n");
      sb.append("\t<option value='70'>70</option>\n");
      sb.append("\t<option value='80'>80</option>\n");
      sb.append("\t<option value='90'>90</option>\n");
      sb.append("\t<option value='100'>100</option>\n");
      sb.append("\t</select>\n");
      sb.append("\t</li>\n");

      sb.append("</ul></div>\n");
      sb.append("<script type=\"text/javascript\">\n");
      sb.append("var totalPage=" + this.totalPage + ";");

      sb.append("function nextPage(page){");
      sb.append("\tif(true && document.forms[0]){\n");
      sb.append("\t\tvar url = document.forms[0].getAttribute(\"action\")+'?'+$('form').eq(0).serialize();\n");
      sb.append("\t\tif(url.indexOf('?')>-1){url += \"&" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";}\n");
      sb.append("\t\telse{url += \"?" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";}\n");
      sb.append("\t\turl = url + page + \"&" + (this.entityOrField ? "page.showCount" : "showCount") + "=" + this.showCount + "\";\n");
      sb.append("\t\tdocument.forms[0].action = url;\n");
      sb.append("\t\tdocument.location = url;\n");
      sb.append("\t}else{\n");
      sb.append("\t\tvar url = document.location.pathname+'';\n");
      sb.append("\t\tif(url.indexOf('?')>-1){\n");
      sb.append("\t\t\tif(url.indexOf('currentPage')>-1){\n");
      sb.append("\t\t\t\tvar reg = /currentPage=\\d*/g;\n");
      sb.append("\t\t\t\turl = url.replace(reg,'currentPage=');\n");
      sb.append("\t\t\t}else{\n");
      sb.append("\t\t\t\turl += \"&" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";\n");
      sb.append("\t\t\t}\n");
      sb.append("\t\t}else{url += \"?" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";}\n");
      sb.append("\t\turl = url + page + \"&" + (this.entityOrField ? "page.showCount" : "showCount") + "=" + this.showCount + "\";\n");
      sb.append("\t\tdocument.location = url;\n");
      sb.append("\t}\n");
      sb.append("}\n");

      sb.append("function changeCount(value){");
      sb.append("\tif(true && document.forms[0]){\n");
      sb.append("\t\tvar url = document.forms[0].getAttribute(\"action\");\n");
      sb.append("\t\tif(url.indexOf('?')>-1){url += \"&" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";}\n");
      sb.append("\t\telse{url += \"?" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";}\n");
      sb.append("\t\turl = url + \"1&" + (this.entityOrField ? "page.showCount" : "showCount") + "=\"+value;\n");
      sb.append("\t\tdocument.forms[0].action = url;\n");
      sb.append("\t\tdocument.location = url;\n");
      sb.append("\t}else{\n");
      sb.append("\t\tvar url = document.location.pathname+'';\n");
      sb.append("\t\tif(url.indexOf('?')>-1){\n");
      sb.append("\t\t\tif(url.indexOf('currentPage')>-1){\n");
      sb.append("\t\t\t\tvar reg = /currentPage=\\d*/g;\n");
      sb.append("\t\t\t\turl = url.replace(reg,'currentPage=');\n");
      sb.append("\t\t\t}else{\n");
      sb.append("\t\t\t\turl += \"1&" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=\";\n");
      sb.append("\t\t\t}\n");
      sb.append("\t\t}else{url += \"?" + (this.entityOrField ? "page.currentPage" : "currentPage") + "=1\";}\n");
      sb.append("\t\turl = url + \"&" + (this.entityOrField ? "page.showCount" : "showCount") + "=\"+value;\n");
      sb.append("\t\tdocument.location = url;\n");
      sb.append("\t}\n");
      sb.append("}\n");

      sb.append("function toTZ(){\n");
      sb.append("var toPaggeVlue = document.getElementById(\"toGoPage\").value;\n");
      sb.append("if(toPaggeVlue == ''){document.getElementById(\"toGoPage\").value=1;return;}");
      sb.append("if(isNaN(Number(toPaggeVlue))||!(Number(toPaggeVlue)>0)||!(Number(toPaggeVlue)<=" + this.totalPage + ")){document.getElementById(\"toGoPage\").value=1;return;}");
      sb.append("nextPage(toPaggeVlue);");
      sb.append("}\n");
      sb.append("</script>\n");
    }
    this.pageStr = sb.toString();
    return this.pageStr;
  }

  public void setPageStr(String pageStr) {
    this.pageStr = pageStr;
  }

  public int getShowCount() {
    return this.showCount;
  }

  public void setShowCount(int showCount)
  {
    this.showCount = showCount;
  }

  public int getCurrentResult() {
    this.currentResult = ((getCurrentPage() - 1) * getShowCount());
    if (this.currentResult < 0)
      this.currentResult = 0;
    return this.currentResult;
  }

  public void setCurrentResult(int currentResult) {
    this.currentResult = currentResult;
  }

  public boolean isEntityOrField() {
    return this.entityOrField;
  }

  public void setEntityOrField(boolean entityOrField) {
    this.entityOrField = entityOrField;
  }
}