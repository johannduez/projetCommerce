function getContextPath() {
   return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}

function selectionCombo(){
	var elt = document.querySelector('select');
	elt.addEventListener('change', function () {
		document.location.href=getContextPath()+"/article/modifierArticle?id="+this.value;
	//	document.location.href="/projetPizza/modifierArticle?id="+this.value;
	})
}