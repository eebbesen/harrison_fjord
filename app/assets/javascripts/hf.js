function toggleLang(){
  if (getLang() == 'dansk') {
    changeLang('dansk', 'svensk');
  } else {
    changeLang('svensk', 'dansk');
  }
}

function getLang() {
  var lang = null;
  var classList = document.getElementById('flag').classList;

  if (classList.contains('dansk')) {
    lang = 'dansk';
  } else if (classList.contains('svensk')) {
    lang = 'svensk';
  }

  return lang;
}

function changeLang(fromLang, toLang){
  var flag = document.getElementById('flag');
  var fjork = document.getElementById('fjork');
  var omain = document.getElementById('omain');
  var toggle = document.getElementById('toggle');

  flag.classList.remove(fromLang);
  flag.classList.add(toLang);
  fjork.classList.remove(fromLang);
  fjork.classList.add(toLang);
  omain.classList.remove(fromLang);
  omain.classList.add(toLang);
  toggle.innerHTML = fromLang;
}
