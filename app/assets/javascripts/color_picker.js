$("#color_picker").spectrum({
  showPalette: true,
  showSelectionPalette: true,
  palette: [ ],
  localStorageKey: "spectrum.homepage",
  chooseText: "Escolher",
  cancelText: "Cancelar",
  move: function(color) {
    var color = color.toHexString();
    $("#category_color").val(color);
  }
});
