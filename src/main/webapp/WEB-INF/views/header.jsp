<%@ include file="/WEB-INF/includes.jsp"%>
<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<ul class="nav navbar-nav">
					<li role="presentation"><a href="#">Home</a></li>
					<li role="presentation"><a href="${s:mvcUrl('PC#list').build() }">Books</a></li>
					<li role="presentation"><a href="${s:mvcUrl('PC#form').build() }">Form</a></li>
				</ul>
			</div>
			<div class="col-md-2">
				<ul class="nav navbar-nav">
					<li role="presentation"><a>github.com/DaviGadelhaLeitao</a></li>
				</ul>
			</div>

		</div>
	</div>
</nav>