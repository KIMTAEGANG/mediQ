window.addEventListener("load", function() {
    var table = document.querySelectorAll("table.result");
    var len = table[0].rows.length-2;
    for (var i = 1; i < len; i+=2) {
        table[0].rows[i].addEventListener("click", function() {
            var desc = this.nextSibling.nextSibling;
            var className = desc.className;
            var table = document.querySelectorAll("table.result");
            var len = table[0].rows.length-2;
            for (var i = 2; i < len; i+=2) {
                table[0].rows[i].className = "hidden";
            }
            if ("hidden" === className) {
                desc.className = "";
            }
        });
    }
});

function f1(){
	if(confirm('������ �����Ͻðڽ��ϱ�?')){
		 return "${pageContext.request.contextPath}/delete.do";
	  }else{

	 }
}
function f2(){
	location.href="count.do"
}


