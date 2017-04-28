"use strict";

var QRCode = require('qrcode');

exports.toCanvasImpl = function toCanvasImpl (canvas,qrString,handle) {
  QRCode.toCanvas(canvas,qrString,function(e) {
    if (e) {
      handle(JSON.stringify(e));
    } else {
      handle(null);
    }
  });
};
