submitImage = () => {
  // 初期化
$("#result").remove();

  // 画像プレビュー
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

    // Loadingエフェクトの作成
    $(".container").css({ 'opacity': '0.3' });
    $("body").append('<div id="loading" class="text-center"></div>')
    $("#loading").append(
      '<div class="spinner-grow text-success" role="status"></div>\
      <div class="spinner-grow text-danger" role="status"></div>\
      <div class="spinner-grow text-warning" role="status"></div>\
      <div class="spinner-grow text-info" role="status"></div>'
    );
    $("#loading").css({
      'position': 'fixed',
      'top': '50%',
      'left': '50%',
      'transform': 'translateY(-50%) translateX(-50%)',
      '-webkit- transform': 'translateY(-50%) translateX(-50%)'
    });
  }

  // フォーム送信
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
