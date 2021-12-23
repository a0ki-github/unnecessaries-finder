submitImage = () => {
  // 初期化
$("#result-wrapper").remove();

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
    $("body").css({ 'opacity': '0.3' });
    $("body").append('<div id="loading"></div>');
    $("#loading").append(
      '<span class="fixed z-10 inset-0 opacity-75 bg-slate-50"></span>\
      <span class="fixed z-20 top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2">\
        <span class="animate-ping inline-flex h-3 w-3 rounded-full bg-red-500 m-2"></span>\
        <span class="animate-ping inline-flex h-3 w-3 rounded-full bg-cyan-500 m-2"></span>\
        <span class="animate-ping inline-flex h-3 w-3 rounded-full bg-yellow-500 m-2"></span>\
        <span class="animate-ping inline-flex h-3 w-3 rounded-full bg-emerald-500 m-2"></span>\
      </span>'
    );
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
