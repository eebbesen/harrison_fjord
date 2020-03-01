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

function selectImage(element){
  element.classList.toggle('selected');
  manipulateDeletionArray(element.id);
}

function manipulateDeletionArray(id){
  element = document.getElementById('markedForDelete')

  arr = null;
  if (element.value.length > 0) {
    arr = element.value.split(',');
  } else {
    arr = [];
  }

  index = arr.indexOf(id);
  if (index > -1){
    arr.splice(index, 1);
  } else {
    arr.push(id);
  }

  element.value = arr.join(',');
}

document.getElementById('toggle').onclick=toggleLang
