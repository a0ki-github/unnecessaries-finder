submitImage = () => {
  // 初期化
$("#result").remove();

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

  // Loadingエフェクト
  $(".container").append(
    '<div class="spinner-grow text-success m-1" role="status"></div>\
    <div class="spinner-grow text-danger m-1" role="status"></div>\
    <div class="spinner-grow text-warning m-1" role="status"></div>\
    <div class="spinner-grow text-info m-1" role="status"></div>'
  );

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
