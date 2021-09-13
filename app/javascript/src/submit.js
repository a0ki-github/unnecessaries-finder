submitImage = () => {
  // プレビュー
  const target = document.querySelector("#room_image")
  const file = target.files[0];
  const reader = new FileReader();
  reader.onloadend = () => {
    const preview = document.querySelector("#preview")
    
    if (preview) {
      preview.src = reader.result;
    }
  }
  if (file) {    
    reader.readAsDataURL(file);
  }
}