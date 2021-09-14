submitImage = () => {
  // プレビュー機能
  const target = document.querySelector("#room_image");
  const file = target.files[0];
  const reader = new FileReader();
  reader.onloadend = () => {
    const preview = document.querySelector("#preview");
    
    if (preview) {
      preview.src = reader.result;
    }
  }
  if (file) {    
    reader.readAsDataURL(file);
  }

  // POSTリクエスト
  const xhr = new XMLHttpRequest();
  const form = document.getElementById('image_form');
  const formData = new FormData(form);
  xhr.open("POST", "/uploads", true);
  xhr.send(formData);
}
