function toggleLang(){
  if (getLang() == 'dansk') {
    changeLang('dansk', 'svenska');
  } else {
    changeLang('svenska', 'dansk');
  }
}

function getLang() {
  var lang = null;
  var classList = document.getElementById('flag').classList;

  if (classList.contains('dansk')) {
    lang = 'dansk';
  } else if (classList.contains('svenska')) {
    lang = 'svenska';
  }

  return lang;
}

function changeLang(fromLang, toLang){
  var flag = document.getElementById('flag');
  var fjork = document.getElementById('fjork');
  var omain = document.getElementById('omain');
  var toggle = document.getElementById('toggle');
  var tr_quote = document.getElementById('tr_quote');

  flag.classList.remove(fromLang);
  flag.classList.add(toLang);
  fjork.classList.remove(fromLang);
  fjork.classList.add(toLang);
  omain.classList.remove(fromLang);
  omain.classList.add(toLang);
  toggle.innerHTML = fromLang;
  if (toLang == 'dansk') {
    tr_quote.innerHTML = dk_quote;
  } else if (toLang == 'svenska') {
    tr_quote.innerHTML = sv_quote;
  }
}
