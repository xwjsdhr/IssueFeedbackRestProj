<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	
		<c:forEach items="${list }" var="image">
			<li>
				<a  href="javascript:void(0)" class="aaa">/IssueFeedbackProject/ImageBrowser?imagePath=${image }</a>
			</li>
		</c:forEach>
	</ul>
	<script type="text/javascript" src="lib/js/app/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="lib/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	

	$(".aaa").click(function(event){
		window.opener.CKEDITOR.tools.callFunction(getUrlParam("CKEditorFuncNum"), event.target.text());
	});
	
	function getUrlParam(paramName){
	  var reParam = new RegExp('(?:[\?&]|&amp;)' + paramName + '=([^&]+)', 'i') ;
	  var match = window.location.search.match(reParam) ;

	  return (match && match.length > 1) ? match[1] : '' ;
	}
	
		
	</script>
</body>
</html>