<%@ include file="/WEB-INF/includes.jsp"%>
<div class="header">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Book Store</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav" id="ul">
        <li><a href="${s:mvcUrl('HC#home').build() }">Home <span class="sr-only">(current)</span></a></li>
        <security:authorize access="isAuthenticated()">
        <li><a href="${s:mvcUrl('PC#list').build() }">Products List</a></li>
        <li><a href="${s:mvcUrl('PC#form').build() }">Form</a></li>
        </security:authorize>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      
        <security:authorize access="!isAuthenticated()"><li><a href="${s:mvcUrl('LC#login').build()}">Login</a></li></security:authorize>
        <li><a href="https://github.com/DaviGadelhaLeitao" rel="nofollow">github.com/DaviGadelhaLeitao</a></li>
        <li><a href="${s:mvcUrl('SCC#items').build() }" rel="nofollow">Shopping cart (${shoppingCart.quantity}) </a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          	<security:authorize access="isAuthenticated()">
          		<security:authentication property="principal.username"/>
          	<span class="caret"></span></security:authorize>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="${s:mvcUrl('LC#logout').build() }">Logout</a></li>
          </ul>
        </li>
      </ul>
      
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</div>




