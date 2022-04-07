// 이미지 보기
function LoadImg(file) {
	var oldFileInfo = $("#fileInfo");

	if (file.files.length != 0 && file.files[0] != 0) {
		var reader = new FileReader();

		reader.readAsDataURL(file.files[0]);
		reader.onload = function(e) {
			if (!oldFileInfo.html(""))
				oldFileInfo.html("");
			$("#img-view").attr('src', e.target.result);
		}
	} else {
		$("#img-view").attr('src', '');
	}
}