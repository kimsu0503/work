<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h2>javascript navigator</h2>
<script>
	console.log(navigator.geolocation);//����� ��ġ������ ��� �ִ� ��ü
	//https�� �ƴϸ� �̰� ������ ����. �������� ������ ��
	//(ũ���� ���� ������ ���Ƽ� �ȵǰ�, ������ �ȴ�)
	navigator.geolocation.getCurrentPosition(function(e){
		console.log(e);
		var lat = e.coords.latitude;
		var lng = e.coords.longitude;
		window.alert(lat + "/" + lng);
	});
</script>