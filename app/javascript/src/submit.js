submitImage = () => {
  // プレビュー機能
  const target = document.getElementById("room_image");
  const file = target.files[0];
  const reader = new FileReader();
  reader.onloadend = () => {
    const preview = document.getElementById("preview");
    
    if (preview) {
      preview.src = reader.result;
    }
  }
  if (file) {    
    reader.readAsDataURL(file);
  }

  // 画像送信機能
  const form = document.getElementById('image_form');
  const formData = new FormData(form);
  $.ajax({
    url: form.action,
    type: form.method,
    data: formData,
    processData: false,
    contentType: false,
    cache: false
  });
}
