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

  // 画像送信機能
  document.querySelector("#submit_button").click();
  
  // 以下コードではなぜかcreate.js.erbを参照できずUnknownFormatエラーが発生。
  // const form = document.getElementById('image_form');
  // xhr.send(formData);

  // 以下コードではエラーは起きないがなぜかcreate.js.erbの内容がビューに反映されず。
  // const xhr = new XMLHttpRequest();
  // const formData = new FormData(form);
  // xhr.open("POST", "/uploads", true);
  // xhr.send(formData);
}
