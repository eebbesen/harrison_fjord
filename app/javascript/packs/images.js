
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

let pics = document.getElementsByClassName('photo col');
for (pic of pics) {
  pic.addEventListener("click", function(event) {
    selectImage(this);
  })
}


