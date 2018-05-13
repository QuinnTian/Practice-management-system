/*文件上传  文件格式和文件大小的限制*/

    var maxsize = 10 * 1024 * 1024; //10M
	var kbsize = 1 * 1024 * 1024; //1M  
	var errMsg = "上传的附件文件不能超过10M！！！";
	var tipMsg = "您的浏览器不支持，建议您使用Firefox 或者Chrome浏览器。不建议使用ie浏览器";
	var browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE") >= 1) {
		browserCfg.ie = true;
	} else if (ua.indexOf("Firefox") >= 1) {
		browserCfg.firefox = true;
	} else if (ua.indexOf("Chrome") >= 1) {
		browserCfg.chrome = true;
	} else if (ua.indexOf("opera") >= 1) {
		browserCfg.opera = true;
	}
	//var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
	function fileChange(target, id) {
		var filesize = 0;
		//var filetypes = [".jpg", ".png", ".rar", ".txt", ".zip", ".doc", ".ppt",".pptx", ".xls", ".pdf", ".docx", ".xlsx" ];
		//var filetypes = ["jpg", "png", "rar", "txt", "zip", "doc", "ppt","pptx", "xls", "pdf", "docx", "xlsx" ];
		var filetypes = ["rar","zip"];
		var filepath = target.value;
		var filemaxsize = 1024 * 10;
		if (filepath) {
			var isnext = false;
			//var fileend = filepath.substring(filepath.indexOf("."));
			//var fileend = filepath.substring(filepath.lastIndexOf(".") + 1);
			var fileend=(filepath.substring(filepath.lastIndexOf(".")+1,filepath.length)).toLowerCase();
			if (filetypes && filetypes.length > 0) {
				for ( var i = 0; i < filetypes.length; i++) {
					if (filetypes[i] == fileend) {
						isnext = true;
						break;
					}
				}
			}
			if (!isnext) {
				alert("不接受此文件类型！仅支持zip和rar格式的文件。");
				target.value = "";
				return false;
			}
		} else {
			return false;
		}
		/* if (isIE && !target.files) {
			var filePath = target.value;
			var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
			if (!fileSystem.FileExists(filePath)) {
				alert("附件不存在，请重新输入！");
				return false;
			}
			var file = fileSystem.GetFile(filePath);
			fileSize = file.Size;
		} else {
			fileSize = target.files[0].size;
		} */
		var obj_file = document.getElementById("fileuploade");
		if (obj_file.value == "") {
			alert("请先选择上传文件");
			return;
		}
		var filesize = 0;
		if (browserCfg.firefox || browserCfg.chrome || browserCfg.opera
				|| browserCfg.qq) {
			filesize = obj_file.files[0].size; //单位为字节
			filesizemb = filesize / 1024; //转换为kb
		} else if (browserCfg.ie) {
			var obj_img = document.getElementById('tempimg');
			obj_img.dynsrc = obj_file.value;
			filesize = obj_img.fileSize;
		} else {
			alert(tipMsg);
			return;
		}
		if (filesize == -1) {
			alert(tipMsg);
			return;
		} else if (filesize > maxsize) {
			alert(errMsg);
			return;
		}
		var size = filesize / 1024;
		if (size > filemaxsize) {
			alert("附件大小不能大于" + filemaxsize / 1024 + "M！");
			target.value = "";
			return false;
		}
		if (size <= 0) {
			alert("附件大小不能为0M！");
			target.value = "";
			return false;
		}
	}